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
From test and training

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
