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
head(Ytest.activity,40)
head(Ytrain.activity,40)

# Merging training data and test data, 
Merge_X.data<-rbind(Xtrain.data,Xtest.data)
Merge_Y.activity<-rbind(Ytrain.activity,Ytest.activity)
Merge.subject<-rbind(train.subject,test.subject)
g<-cbind(Merge_X.data,Merge_Y.activity, Merge.subject)

features<-read.table("features.txt")
fratures<-t(features)
head(features,10)
names(Merge_X.data)<-features[,2]
features_mean_and_std <- grep("-(mean|std)\\(\\)", features[,2])
Merge_X.data <- Merge_X.data[, features_mean_and_std]
names(Merge_X.data)<-features[features_mean_and_std,2]


activity.labels<-read.table("activity_labels.txt")
activity.labels[,2]<-as.character(factor(activity.labels[,2]),labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
Merge_Y.activity[, 1]<-activity.labels[Merge_Y.activity[, 1], 2]
names(Merge_Y.activity) <- "activity"

names(Merge.subject)<-"subject"
Data<-cbind(Merge_X.data,Merge_Y.activity,Merge.subject)
head(Data[65:68])

library(plyr)
averages_data <- ddply(Data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data,"averages_data.txt",row.name=FALSE)
TidyData<-read.table("averages_data.txt",header = T)
