Terms And Conditions Generator

# Features
- No UI or Rails
- Just Plain Ruby with Object Oriented Design
- Good quality tests
- Good names of classes and methods

# Installation
$ Git Clone Repository 
$ Ruby v2.5.1

# Running the app
- using ruby\
$ ruby main.rb

- using shell file\
$ sudo chmod 755 start.sh\
$ ./start.sh

# Running the Tests
$ ruby test.rb

# How To Perform Transformation
1. Run the app
2. Provide both of the filenames (dataset and template) as the input from the terminal(console)
3. App will perform the transformation and displays the transformed file on the terminal if there are no errors 
4. On Successfull transformation, transformed file is also saved as "transformed_template.txt"
5. Any kind of errors (File Not Found, Section/Clauses Not found in Datasets, Clause_ids in Section doesnot exists in dataset) will be displayed on terminal and also will be logged into "error_logs.txt". Please do check error logs for further details of error.



