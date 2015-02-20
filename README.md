# getdata-011 Course Project

## Run:

- Download [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to project directory
- Open R console and set working directory to project directory
- Load script with: ```source('run_analysis.R')```
- Run script with: ```run_analysis()```
- Script writes data from step 4 to ```data.txt``` and data form step 5 to ```summary.txt```
- Load output data with ```read.table```, for example: ```data <- read.table("data.txt")```

## Step By Step

- ```run_analysis.R``` checks if ```UCI HAR Dataset``` directory exists.
  If yes, it loads files from it, otherwise tries to load files from current directory. 
- Loads ```features.txt``` to use it as column names for ```X_train.txt``` and ```X_test.txt```.
- After loading ```X_train.txt``` and ```X_test.txt```
  columns which names contains ```.mean.``` or ```.std.``` are extracted.
- ```y_train.txt``` and ```y_test.txt``` are matched with labels from ```activity_labels.txt```
  and loaded to ```activity``` column.
- ```subject_train.txt``` and ```subject_test.txt``` are loaded to ```subject``` column.
- File ```data.txt``` with current dataset is saved.
- File ```summary.txt``` with mean value for each variable for each activity and subject is saved.