#! /usr/bin/env python3

import os

# remove an existing database
if os.path.exists("gradebook.db"):
    os.remove("gradebook.db")

# create a connection to the db using the nbgrader API
from nbgrader.api import Gradebook
gb = Gradebook("sqlite:///gradebook.db")

# add the assignment to the database and specify a due date
gb.add_assignment("ProblemSet1")#, duedate="2015-02-01 15:00:00.000000 PST")
