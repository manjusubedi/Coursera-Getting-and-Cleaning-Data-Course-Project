##################################################################################################

## Course Project in Getting and Cleaning Data from Coursera
## Manju Subedi
## 06/20/2015


## Short Decription about this code:

## This code will perform the transformation on the data given here:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## The following steps are taken to crate tidy data set from given raw data.
## 1. Merge the training and the test sets to create one data set.
## 2. Extract only the measurements on the mean and standard deviation for each measurement. 
## 3. Use descriptive activity names to name the activities in the data set
## 4. Appropriately label the data set with descriptive activity names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Clean up Workspace
rm(list=ls())
library(plyr)

##################################################################
## 1. Merges the training and the test sets to create one data set.
##################################################################

## For my convenience I have created a folder, downloaded and unzipped all the only required file 
## from the website provided here. So there is no subfolder in my directory.
## set working directory, the location where the all required dataset are.

setwd("C:/Users/Kapil/Downloads/Getting and Cleaning data Project")

# reading data from the my working directory
# reading X_test and X_train file 
Xtest.data<-read.table("X_test.txt")
Xtrain.data<-read.table("X_train.txt")
dim(Xtest.data)
dim(Xtrain.data)

# reading subject files
test.subject<-read.table("subject_test.txt")
train.subject<-read.table("subject_train.txt")
dim(test.subject)
dim(train.subject)

# reading Y_test and Y_train (activity) files
Ytest.activity<-read.table("y_test.txt")
Ytrain.activity<-read.table("y_train.txt")
dim(Ytest.activity)
dim(Ytrain.activity)

## Merging training data and test data,  

## Merging Xtrain and Xtest data first,
Merge_X.data<-rbind(Xtrain.data,Xtest.data)

## Merging Ytrain and Ytest.activity file
Merge_Y.activity<-rbind(Ytrain.activity,Ytest.activity)

## Merging train.subject and test.subject file
Merge.subject<-rbind(train.subject,test.subject)

############################################################################################
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
############################################################################################

## Read the features file (column names)
features<-read.table("features.txt")

## assigning the colum names to the Merge_X.data
names(Merge_X.data)<-features[,2]

## Chooding the interested column (column with mean() and std() in their column name)
features_mean_and_std <- grep("-(mean|std)\\(\\)", features[,2])

## Subsetting the desired columns
Merge_X.data <- Merge_X.data[, features_mean_and_std]

## assigning the respected column name to the desired columns
names(Merge_X.data)<-features[features_mean_and_std,2]

###########################################################################
# 3. Uses descriptive activity names to name the activities in the data set
###########################################################################

## read the activity labels file
activity.labels<-read.table("activity_labels.txt")
activity.labels[,2]<-as.character(factor(activity.labels[,2]),labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

## assigning the corresponding activity names to the values in Merge_Y.activity
Merge_Y.activity[, 1]<-activity.labels[Merge_Y.activity[, 1], 2]

#########################################################################
# 4. Appropriately label the data set with descriptive activity names. 
#########################################################################

## Assigning the column name to the Merge_Y.activity
names(Merge_Y.activity) <- "activity"

## Assigning the column name to Merge_subject 
names(Merge.subject)<-"subject"

## Binding all the data in a single data set
Final.Data<-cbind(Merge_X.data,Merge_Y.activity,Merge.subject)

colNames  <- colnames(Final.Data)

# Cleaning up the variables names

for (i in 1:length(colNames)) 
{
    colNames[i] = gsub("\\()","",colNames[i])
    colNames[i] = gsub("-std$","StdDev",colNames[i])
    colNames[i] = gsub("-mean","Mean",colNames[i])
    colNames[i] = gsub("^(t)","time",colNames[i])
    colNames[i] = gsub("^(f)","freq",colNames[i])
    colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
    colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
    colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
    colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
    colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
    colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
    colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

# Reassigning the new descriptive column names to the Final.Data set
colnames(Final.Data) <- colNames;

######################################################################################################################
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
######################################################################################################################

## Averaging each variable by function colMeans for each activity 
averages_data <- ddply(Final.Data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data,"averages_data.txt",row.name=FALSE)
view(averages_data)
