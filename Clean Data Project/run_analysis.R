# Instruction was to the Submitted Code That works as long as the Data is present in the Working Directory
# But the code below is also capable of Downloading the Zip file and Unzipping it
# Only when the Data Folder is not present in the Working Directory

# Store the File name of the Zip file so that it can be used elsewhere
# File name is taken dynamically to avoid using unwanted data with same name. 

# It helps a lot when you use same WD for multiple projects
if(!file.exists("UCI HAR Dataset")){

  datazip <- paste("data",gsub(":","_",as.character(as.POSIXlt(Sys.time(), "GMT"))),".zip",sep = "")

# check if the File is there or not and then download the file.

  if(!file.exists(datazip)){ #if the file doesnot exist download it.

  
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",datazip)

  }

# Unzip The File

  unzip(datazip)
}

# Now all the required Files are downloaded and unzipped.
# in short they are ready to be used
# So lets start Actual Coding

#######################################################
# Step 1: Merging the Training Data and Test Data.

# Get Test Data

test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
test_Y <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_Sub <- read.table("UCI HAR Dataset/test/subject_test.txt")


# Get Train Data

train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
train_Y <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_Sub <- read.table("UCI HAR Dataset/train/subject_train.txt")


# Merge the Data to get a unified version

Tot_X <- rbind(test_X,train_X)
Tot_Y <- rbind(test_Y,train_Y)
Tot_Sub <- rbind(test_Sub,train_Sub)


#######################################################
# Step 2: Extract only the measurements on the mean and standard deviation for each measurement


# Column Names for the Data Set "Tot_X" are stored Here

ColNames <- read.table("UCI HAR Dataset/features.txt")

# Assign the Column Names to the Data set
names(Tot_X) <- ColNames[,2]


# We need to get columns with Mean or Std Deviation Only,
# This is indicated by the presence of mean()/std() in the column names

Req_Cols <- grep("mean\\(\\)|std\\(\\)", ColNames[, 2])


# subset the desired columns

Sub_X <- Tot_X[, Req_Cols]


#######################################################
# Step 3: Use descriptive activity names to name the activities in the data set

# Activities are Stored Here in a key-value pair format that can be used to decode the data from "Tot_Y"

Activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# Since "Tot_Y" Contains Activities Name the Column properly
names(Tot_Y) <- "Activity"

# Decode each activity and assing them proper Values
Tot_Y[,1] <- Activities[Tot_Y[,1],2]

#Column Names in Sub_X are not so meaningful for the end user
#we will try to make them a bit better

# Rename short codes to long
names(Sub_X)<-gsub("^t", "Time ", names(Sub_X))
names(Sub_X)<-gsub("^f", "Frequency ", names(Sub_X))
names(Sub_X)<-gsub("Acc", " Accelerometer ", names(Sub_X))
names(Sub_X)<-gsub("Gyro", " Gyroscope ", names(Sub_X))
names(Sub_X)<-gsub("Mag", " Magnitude ", names(Sub_X))
names(Sub_X)<-gsub("BodyBody", " Body ", names(Sub_X))
# Remove "-"
names(Sub_X)<-gsub("-", " ", names(Sub_X))
# Remove Extra Spaces
names(Sub_X)<-gsub("  ", " ", names(Sub_X))

#Finally 
#"fBodyBodyGyroJerkMag-std()" will look like 
#"Frequency Body Gyroscope Jerk Magnitude std()" 

#######################################################
# Step 4: Label the data set with descriptive variable names.

# only the data set that is not named so far is "Tot_Sub", so lets name it
names(Tot_Sub) <- "Subject"

# Now Join "Sub_X","Tot_Y","Tot_Sub" to make them a single data set.
# It is better to put the Subject ID first followed by activity and then the Data for easier visualisation

Complete_Data <- cbind(Tot_Sub,Tot_Y,Sub_X)


#######################################################
# Step 5: Create an independent tidy data set with the average of each variable for each activity and each subject.

# using "Complete_Data" we do the final and important step of reducing the data, to get a small consise and meaning full data.

Final <- aggregate(Complete_Data[,3:68],by=list(Subject = Complete_Data$Subject,Activity=Complete_Data$Activity),mean)

# now arrange the Data in an order
Final <- arrange(Final,Subject,Activity)

# finally export the data to a file and submit the Data

write.table(Final, "TidyData.txt",row.name=FALSE)