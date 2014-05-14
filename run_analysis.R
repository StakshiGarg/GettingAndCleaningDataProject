setwd("UCI HAR Dataset")
## read required files in memory 
subjectTest<-scan("test/subject_test.txt", what="", sep="\n")
xtest<-scan("test/X_test.txt", what="", sep="\n")
ytest<-scan("test/Y_test.txt", what="", sep="\n")
subjectTrain<-scan("train/subject_train.txt", what="", sep="\n")
xtrain<-scan("train/X_train.txt", what="", sep="\n")
ytrain<-scan("train/Y_train.txt", what="", sep="\n")
features<-scan("features.txt", what="", sep="\n")
activity<-scan("activity_labels.txt", what="", sep="\n")
####################################################
## if needed we can also get additional info but not required in this case
##bodyAccxtrain<-scan("train/Inertial Signals/body_acc_x_train.txt", what="", sep="\n")
##bodyAccytrain<-scan("train/Inertial Signals/body_acc_y_train.txt", what="", sep="\n")
##bodyAccztrain<-scan("train/Inertial Signals/body_acc_z_train.txt", what="", sep="\n")
##bodyGyroxtrain<-scan("train/Inertial Signals/body_gyro_x_train.txt", what="", sep="\n")
##bodyGyroytrain<-scan("train/Inertial Signals/body_gyro_y_train.txt", what="", sep="\n")
##bodyGyroztrain<-scan("train/Inertial Signals/body_gyro_z_train.txt", what="", sep="\n")
##totalAccxtrain<-scan("train/Inertial Signals/total_acc_x_train.txt", what="", sep="\n")
##totalAccytrain<-scan("train/Inertial Signals/total_acc_y_train.txt", what="", sep="\n")
##totalAccztrain<-scan("train/Inertial Signals/total_acc_z_train.txt", what="", sep="\n")
##bodyAccxtest<-scan("test/Inertial Signals/body_acc_x_test.txt", what="", sep="\n")
##bodyAccytest<-scan("test/Inertial Signals/body_acc_y_test.txt", what="", sep="\n")
##bodyAccztest<-scan("test/Inertial Signals/body_acc_z_test.txt", what="", sep="\n")
##bodyGyroxtest<-scan("test/Inertial Signals/body_gyro_z_test.txt", what="", sep="\n")
##bodyGyroxtest<-scan("test/Inertial Signals/body_gyro_x_test.txt", what="", sep="\n")
##bodyGyroytest<-scan("test/Inertial Signals/body_gyro_y_test.txt", what="", sep="\n")
##bodyGyroztest<-scan("test/Inertial Signals/body_gyro_z_test.txt", what="", sep="\n")
##totalAccXtest<-scan("test/Inertial Signals/total_acc_x_test.txt", what="", sep="\n")
##totalAccytest<-scan("test/Inertial Signals/total_acc_y_test.txt", what="", sep="\n")
##totalAccztest<-scan("test/Inertial Signals/total_acc_z_test.txt", what="", sep="\n")
#####################################################

# load library for string functions
library(stringr)
## remove extra spaces
xtest<-str_trim(xtest)
xtrain<-str_trim(xtrain)
features<-str_trim(features)
activity<-str_trim(activity)

## split each row on one or more space
xtest <- strsplit(xtest, "[[:space:]]+")
xtrain <- strsplit(xtrain, "[[:space:]]+")
features<-strsplit(features, "[[:space:]]+")
activity <-strsplit(activity, "[[:space:]]+")

## change list of list to data frame
xtest<-data.frame(t(sapply(xtest,c)))
xtrain <-data.frame(t(sapply(xtrain,c)))
features <-data.frame(t(sapply(features,c)))
activity <-data.frame(t(sapply(activity,c)))

# change column names for test data sets
colnames(xtest)<-as.vector(features[,2])
colnames(xtrain)<-as.vector(features[,2])

## combine multiple data to form test data frame and train data frame
test<-cbind (subjectTest,ytest,xtest)
train<-cbind(subjectTrain, ytrain,xtrain)

## chnage colomn names so that we can row wise bind frames
colnames(test)[1] <- "subject"
colnames(train)[1] <- "subject"
colnames(train)[2] <- "activity"
colnames(test)[2] <- "activity"

##1.	Merges the training and the test sets to create one data set.
mergedData<-rbind(test,train)

##2. Extracts only the measurements on the mean and standard deviation for each measurement. All such features have mean() or std() in their name
mergedData <-mergedData[,grep("(mean\\(\\)|std\\(\\)|subject|activity)",colnames(mergedData))]

##	3.	Uses descriptive activity names to name the activities in the data set
 activity<-as.vector(activity[,2])
 mergedData$activity<-as.character(factor(mergedData$activity,labels=activity))

## 	4.	Appropriately labels the data set with descriptive activity names. 
## removing special char
colnames(mergedData)<-gsub("mean\\(\\)","Mean",colnames(mergedData))
colnames(mergedData)<-gsub("std\\(\\)","Std",colnames(mergedData))
colnames(mergedData)<-gsub("-","",colnames(mergedData))
## its good to have all lower names but not readable in current set.
##colnames(mergedData)<-tolower(colnames(mergedData))
##5 .Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#convert columns to numeric 
install.packages("Hmisc")
library(Hmisc)
#converting to numeric data
mergedData[,3:68]<-apply(mergedData[,3:68], 2, function(x) as.numeric(as.character(x)))
mergedData$subject <- as.numeric(as.character(mergedData$subject))
#final summary
mergedData <-summarize(mergedData[colnames(mergedData)[3:68]], mergedData[c('subject', 'activity')], colMeans, stat.name = NULL)
#final ordered summary
mergedData<-mergedData[with(mergedData, order(subject, activity)), ]
