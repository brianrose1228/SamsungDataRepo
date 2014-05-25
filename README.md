## run_analysis.R

This script imports all files from source:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script assembles the column names, subjectids and activityids and then merges the test and training data.

Once these operations are complete the script will calculate the mean for all mean and standard deviation measurements (variables with mean/std in the name).

More information about the data can be found in CodeBook.md or http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 