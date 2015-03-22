###
# You should create one R script called run_analysis.R that does the following. 
# 
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, 
#    independent tidy data set with the average of each variable for each activity and each subject.
###

## Load the plyr package and set working directory: ##
library(plyr)
#data_dir <- "C:\\RXDATA\\Coursera\\3 - Getting and Cleaning Data\\Course Project\\UCI-HAR-Dataset"
data_dir <- "path to your local UCI-HAR-Dataset folder"
setwd(data_dir)

## 1) Read and merge the training and the test sets to create one data set. ##
# create 'x' data set:
x_ <- rbind( read.table("train\\X_train.txt"),
             read.table("test\\X_test.txt") )
# create 'y' data set:
y_ <- rbind( read.table("train\\y_train.txt"),
             read.table("test\\y_test.txt") )
# create 'subject' data set:
subj_ <- rbind( read.table("train\\subject_train.txt"), 
                read.table("test\\subject_test.txt") )

## 2) Extracts only the measurements on the mean and standard deviation for each measurement. ##
#read the list of measurements: 
features <- read.table("features.txt")
# using regexp, select only measurements with mean or std in their names:
mean_std_list <- grep("-(mean|std)\\(\\)", features[, 2])
# subset the desired columns:
x_ <- x_[, mean_std_list]
# set column names:
names(x_) <- features[mean_std_list, 2]

## 3) Uses descriptive activity names to name the activities in the data set ##
# read the list of activities:
act_labeles <- read.table("activity_labels.txt")
# update values with correct activity names:
y_[, 1] <- act_labeles[y_[, 1], 2]
# set column name:
names(y_) <- "activity"

## 4) Appropriately labels the data set with descriptive variable names. ##
# correct column name:
names(subj_) <- "subject"
# bind all the data into a single data set:
all_ <- cbind(x_, y_, subj_)

## 5) From the data set in step 4, creates a second, independent tidy data set ## 
##    with the average of each variable for each activity and each subject.    ##
# Set activity and subject as factors and calculate avg by activity-subject:
all_$activity <- as.factor(all_$activity)
all_$subject <- as.factor(all_$subject)
avg_ = aggregate(all_, by=list(activity = all_$activity, subject=all_$subject), mean)
# write tidy data into text file:
write.table(avg_[,1:68], "avg_data.txt", row.name=FALSE)
