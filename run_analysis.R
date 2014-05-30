#Load Required Libraries
library(plyr)

#enter working directory here
directory<-"C:\\Users\\F3NiXR0ZE\\Dropbox\\Coursera Data Science Specialization\\Getting and Manipulating Data\\Peer Assessment\\UCI HAR Dataset"
setwd(directory)

#activity_labels Maps ActivityTypeId to ActivityTypeName
activity_labels<-read.table("activity_labels.txt")
colnames(activity_labels)<-c("ActivityTypeId","ActivityTypeName")

#features Maps colnumbers to colnames
features<-read.table("features.txt")
colnames(features)<-c("ColNum","ColName")
features$ColName<-gsub("[.]","",make.names(features$ColName)) #use make.names() to meet naming standards defined by dataframe



#Read & Format training and test set

  ##training data sets
setwd("train") #assumes train folder is in current working directory

    #set of measurements from the dataset, with activity excluded, no colnames
    trainX<-read.table("X_train.txt")
    colnames(trainX)<-features$ColName  #How do I know
  
    # activity type ids for each measurement in trainX
    trainY<-read.table("Y_train.txt")
    colnames(trainY)<-"ActivityTypeId"
    activity_train<-merge(trainY,activity_labels,by.x="ActivityTypeId",by.y="ActivityTypeId")
  
    # subjectid for each measurement 
    subject_train<-read.table("subject_train.txt")
    colnames(subject_train)<-"SubjectId"
  
    # Merge columns together
    TrainData<-cbind(subject_train, activity_train, trainX)

    
  
  #test data sets
    setwd(paste(directory,"/test", sep=""))
  
  #assumes test folder is in the main directory
    #set of measurements from the dataset, with activity excluded, no colnames
    testX<-read.table("X_test.txt")
    colnames(testX)<-features$ColName  #How do I know
    
    # activity type ids for each measurement in trainX
    testY<-read.table("Y_test.txt")
    colnames(testY)<-"ActivityTypeId"
    #Appropriately labels the data set with descriptive activity names. 
    activity_test<-merge(testY,activity_labels,by.x="ActivityTypeId",by.y="ActivityTypeId")
    
    # subjectid for each measurement 
    subject_test<-read.table("subject_test.txt")
    colnames(subject_test)<-"SubjectId"
    
    # Merge columns together
    TestData<-cbind(subject_test, activity_test, testX)

#Merges the training and the test sets to create one data set.
  MergedData<-rbind(TrainData,TestData)
#Extracts only the measurements on the mean and standard deviation for each measurement. Uses grepl for wildcard match on mean/std
  FinalData<-cbind(
                  MergedData[,1:2] #keep the SubjectId, ActivityTypeId and ActivityTypeName
                  ,MergedData[, grepl("mean",colnames(MergedData)) | grepl("std",colnames(MergedData))]) #include mean/std columns only

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# Create TidyData which is average of every measure aggregated at subjectid and activitytypeid
TidyData <-aggregate(FinalData, by=list(FinalData$SubjectId,FinalData$ActivityTypeId),
                    FUN=mean, na.rm=TRUE)

# and because i can't find the arg to turn off Group1/2 colnames created by aggregate
TidyData<-TidyData[,3:ncol(TidyData)]
TidyData<-merge(TidyData,activity_labels,by.x="ActivityTypeId",by.y="ActivityTypeId")

# Aggregate didn't like activity string label so i'm going to reorganize the columns a bit to get in back in
TidyData<-cbind(cbind(TidyData[,1:2],TidyData[,ncol(TidyData)]),TidyData[,4:ncol(TidyData)-1])
colnames(TidyData)[3]<-"ActivityTypeName"

#create output file
setwd(directory)
write.table(TidyData, "SamsungTidyData.txt", sep="\t") 
