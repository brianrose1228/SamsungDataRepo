<<<<<<< HEAD
## run_analysis.R

This script imports all files from source:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script assembles the column names, subjectids and activityids and then merges the test and training data.

Once these operations are complete the script will calculate the mean for all mean and standard deviation measurements (variables with mean/std in the name).

More information about the data can be found in CodeBook.md or http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
=======
## ReadMe for run_analysis.R

This script imports all files found in the zip file from the following url:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

More information about the data can be found in CodeBook.md or http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The script performs the following operations:

    * Merges the training and the test sets to create one data set.
    * Extracts only the measurements on the mean and standard deviation for each measurement. 
    * Uses descriptive activity names to name the activities in the data set
    * Appropriately labels the data set with descriptive activity names. 
    * Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The script will also output this data to a text file in the working directory set at the top.

>>>>>>> 6a26a00727bed7840cc05be0da8145b7cb40fbca
