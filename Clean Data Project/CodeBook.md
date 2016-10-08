# `run_analysis.R`

Code has several in line explanatory comments.
This is an additional file for the ease of users.

## Variables

* `datazip` : This is a dynamically initialised name the downloadable Zip file

####Variables containing Test Data
* `test_X` : Contains the data from the file `X_test.txt`
* `test_Y` : Contains the data from the file `Y_test.txt`
* `test_Sub` : Contains the data from the file `subject_test.txt`

####Variables containing Training Data
* `train_X` : Contains the data from the file `X_train.txt`
* `train_Y` : Contains the data from the file `Y_train.txt`
* `train_Sub` : Contains the data from the file `subject_train.txt`

####Variables containing Combined Data 
######From test data and training data

* `Tot_X` : Contains the Combined data `X`
* `Tot_Y` : Contains the Combined data `Y`
* `Tot_Sub` : Contains the Combined data `subjects`
* `Sub_X` : Contains the Subset data from `Tot_Sub` that is required for the analysis
* `Complete_Data` : Contains the combined data of variables `Tot_X`,`Tot_Y`,`Sub_X`
* `Final` : Contains the aggregated data of the variable `Complete_Data`

####Variables containg Descriptive Names
* `ColNames` : Contains the Data from `features.txt`, and contains the names of the columns in `Tot_x`
* `Req_Cols` : Contains a subset of `ColNames` that refer to means and standard deviations
* `Activities` : Contains the data from `actiity_labels.txt`, and contains the names of activities present in the variables `test_Y`,`train_Y`,`Tot_Y`

#Steps involved in the Code

#### Step 0
* Verify whether the Data is present or not.
* If the data is not present download it from the url `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`
* Unzip the file to extract the data

#### Step 1

* Load the Test Data
* Load the Training Data
* Combine the Test Data and Training Data to get a Unified Data

#### Step 2
* Load the Column Names
* Assign them to the data
* Identify the required Columns for analysis
* Extract the data from required Columns

####Step 3
* Add Activity Labels to the Data
* Modify the column names to be more readable and meaningful

#### Step 4
* Combine the data from `Tot_X`,`Tot_Y`,`Sub_X` to get a single Data table

#### Step 5
* Aggregate the data.
* Write it out to a file
