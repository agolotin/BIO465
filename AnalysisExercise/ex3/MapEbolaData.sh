#!/bin/bash

# Tell the script to exit if an error occurs, rather than to continue processing
set -o errexit

# Create subdirectories if they don't already exist
mkdir -p sra bam refs

##########################################################
# Download and compile software
##########################################################

# Download edirect software from NCBI
# This software makes it possible to access the NCBI databases that contain information
# about the available data
curl -O ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/edirect.tar.gz

# Unpack and unzip the edirect software into an "edirect" subdirectory
tar -zxvf edirect.tar.gz

# Delete the .tar.gz file because it is no longer needed
rm -f edirect.tar.gz

# Clone the BWA git repository
# This software is a hash-based aligner that will align the FASTQ data to the ebolavirus reference genome
# By using git, we will download the most recent version of the source code for bwa
git clone https://github.com/lh3/bwa.git

# Compile the BWA software using the Make utility
cd bwa
make
cd ..

# We also need samtools for this analysis. BYU's supercomputer already has it installed, so we
# just need to load the module (see https://marylou.byu.edu/documentation/apps/softwareModuleList)
module load samtools/1.2

# Download the "parallel" software so we can process multiple data files simultaneously
# This we are using the wget command rather than curl to download it
wget http://ftp.gnu.org/gnu/parallel/parallel-20160122.tar.bz2

# Unpack the file and compile it
# Note that this time we have to "configure" before we "make"
tar -jxvf parallel-20160122.tar.bz2
cd parallel-20160122
./configure
make
cd ..

# Delete the .tar.bz2 file because it is no longer needed
rm -f parallel-20160122.tar.bz2

# Download the sra toolkit software that will enable us to download the FASTQ files
wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.5.7/sratoolkit.2.5.7-centos_linux64.tar.gz

# This software is precompiled for CentOS Linux, which is what the supercomputer uses, so
# we don't need to compile anything, just extract it.
tar -zxvf sratoolkit.2.5.7-centos_linux64.tar.gz
rm -f sratoolkit.2.5.7-centos_linux64.tar.gz

# Clone and build the freebayes software that will allow us to identify DNA variants
git clone --recursive git@github.com:ekg/freebayes.git
cd freebayes
make
cd ..

# Download snpEff software, which enables us to annotate the VCF file
wget -O snpEff_latest_core.zip "http://downloads.sourceforge.net/project/snpeff/snpEff_latest_core.zip?r=http%3A%2F%2Fsnpeff.sourceforge.net%2Fdownload.html&ts=1453834903&use_mirror=netcologne"
unzip snpEff_latest_core.zip
rm -f snpEff_latest_core.zip

##########################################################
# Obtain and prepare the Ebola reference genome (FASTA file)
##########################################################

# Create a variable that indicates where the reference genome will be stored locally
REF=refs/KJ660346.fa

# Retrieve the reference genome from NCBI
edirect/efetch -db nucleotide -id KJ660346 -format fasta > $REF

# Fix ids to match the snpEff annotation database (see below)
sed -i 's/gi|674810549|gb|KJ660346.2|/KJ660346/' $REF

# Index the reference genome
bwa/bwa index $REF
samtools faidx $REF

##########################################################
# Obtain the FASTQ files for 60 ebolavirus samples
##########################################################

# Download information from NCBI web site about the Ebola experimental data
# See http://www.ncbi.nlm.nih.gov/bioproject/PRJNA257197
edirect/esearch -db sra -query PRJNA257197 | edirect/efetch -format runinfo > refs/runinfo.txt

# Filter on the samples that were performed on 2015-04-14
# To simplify the analysis, select the first 60 genome samples
cat refs/runinfo.txt | grep "2015-04-14" | cut -f 1 -d ',' | grep SRR | head -60 > refs/sraids.txt

# Download the raw data and convert it to FASTQ format
cat refs/sraids.txt | parallel sratoolkit.2.5.7-centos_linux64/bin/fastq-dump -X 15000 -O sra --split-files {}

# Align the FASTQ data to the reference genome using BWA
# Convert the resulting SAM formatted data to BAM files
# Sort the BAM files
# Note that all of this is done on a single line using pipes
# This saves disk space and is faster than saving files to the file system
# Also note that the samples are processed in parallel
cat refs/sraids.txt | parallel "bwa/bwa mem -R '@RG\tID:{}\tSM:{}\tLB:{}' $REF sra/{}_1.fastq sra/{}_2.fastq 2> /dev/null | samtools view -b - | samtools sort -o - tmp > bam/{}.bam"

# Index each BAM file (in parallel)
ls bam/*.bam | parallel samtools index {}

# Call variants using freebayes
freebayes/bin/freebayes -p 1 -f $REF bam/*.bam > results.vcf

# Annotate the VCF file using snpEff
java -jar snpEff/snpEff.jar -v ebola_zaire results.vcf > Annotated_Variants.vcf
