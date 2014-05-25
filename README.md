## run_analysis.R

This script imports all files found in the zip file from the following url:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

More information about the data can be found in CodeBook.md or http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The script assembles the column names, subjectids and activityids and then merges the test and training data.

Once these operations are complete the script will calculate the mean for all mean and standard deviation measurements (variables with mean/std in the name) and store this data in a dataframe called TidyData.  
The script will also output this data to a text file in the working directory set at the top.

