#rm(list=ls())
library(data.table)
#Users must update the setwd command below to their appropriate location:
setwd("/Users/karlakoudelka/Rcode/coursera work/UCI HAR Dataset/")

activity_labels<-read.delim("activity_labels.txt", sep="", header=FALSE)
features<-read.delim("features.txt", sep="", header=FALSE)

#reading in X_train data set and adding descriptive column names
X_train<-read.delim("X_train.txt", sep="", header = FALSE)
subject_train<-read.delim("subject_train.txt", header=FALSE)
y_train<-read.delim("y_train.txt", header=FALSE)
descriptive_columns<-features[[2]]
colnames(X_train)<-descriptive_columns

#adding the subject and activity columns to train object, updating descriptive column names
X_train<-cbind(subject_train, y_train, X_train)
colnames(X_train)[1]="subject"
colnames(X_train)[2]="activity"

#reading in X_test data set and adding descriptive column names
X_test<-read.delim("X_test.txt", sep="", header=FALSE)
subject_test<-read.delim("subject_test.txt", sep="", header=FALSE)
y_test<-read.delim("y_test.txt", sep="", header=FALSE)
colnames(X_test)<-descriptive_columns

#adding the subject and activity columns to test object, updating descriptive column names
X_test<-cbind(subject_test, y_test, X_test)
colnames(X_test)[1]="subject"
colnames(X_test)[2]="activity"

#combine both X_test and X_train objects into one data object
data<-rbind(X_test, X_train)

#reduce data object to just columns dealing with mean or standard deviation
mean.index<-grep("mean",colnames(data))
std.index<-grep("std",colnames(data))
all.index<-c(mean.index, std.index)
data<-data[,c(1,2,all.index)]

#changing activity code to descriptive name
for (i in 1:dim(data)[1]){
  if (data[i,"activity"]==1) {data[i,"activity"]="WALKING"}
  else if (data[i,"activity"]==2) {data[i,"activity"]="WALKING_UPSTAIRS"}
  else if (data[i,"activity"]==3) {data[i,"activity"]="WALKING_DOWNSTAIRS"}
  else if (data[i,"activity"]==4) {data[i,"activity"]="SITTING"}
  else if (data[i,"activity"]==5) {data[i,"activity"]="STANDING"}
  else if (data[i,"activity"]==6) {data[i,"activity"]="LAYING"}
  }

#creating new data object that shows average of each variable for each activity and each subject
data$activity<-as.factor(data$activity)
new.data<-as.data.frame(matrix(,nrow=180, ncol=ncol(data)))
colnames(new.data)<-colnames(data)
new.data$subject=rep(1:30, each=6)
new.data$activity=rep(levels(data$activity), each=1, times=30)

for (i in 1:30){
  for (j in levels(data$activity)){
    interim<-data[which(data$subject==i & data$activity==j),3:81]
    new.data[which(new.data$subject==i & new.data$activity==j),3:81]=colMeans(interim)
    }}

write.table(new.data, "new.data.txt", row.names=FALSE)
