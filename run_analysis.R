## Author: Maria Jose Zamorano
##
## Course Project
##
## Date: September, 2015

## You should create one R script called run_analysis.R that does the 
## following: 


library(reshape2)
message("Starting processing...")

############################################################################
## 1. Merges the training and the test sets to create one data set.
############################################################################
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
yTest  <- read.table("./UCI HAR Dataset/test/y_test.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt") 
xTest  <- read.table("./UCI HAR Dataset/test/X_test.txt")
sTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
sTest  <- read.table("./UCI HAR Dataset/test/subject_test.txt")

x <- rbind(xTrain, xTest)
y <- rbind(yTrain, yTest)
s <- rbind(sTrain, sTest)

features <- read.table("./UCI HAR Dataset/features.txt")
xNames <- features$V2
xNames <- gsub("()", "", xNames, fixed=T)
xNames <- gsub("-", "_", xNames, fixed=T)
xNames <- gsub("mean", "Mean", xNames, fixed=T)
xNames <- gsub("std", "Std", xNames, fixed=T)

names(s) <- "Subject_ID"     
names(y) <- "Activity"
names(x) <- xNames

data <- cbind(s, y, x)


############################################################################
## 2. Extracts only the measurements on the mean and standard deviation 
## for each measurement. 
############################################################################
matching <- grep("Mean|Std|Subject|Activity", names(data))
table    <- data[ ,matching]


############################################################################
## 3. Uses descriptive activity names to name the activities in the data set
############################################################################
actLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
table$Activity <- factor(table$Activity, levels = as.character(actLabels$V1),
                         labels = actLabels$V2)


############################################################################
## 4. Appropriately labels the data set with descriptive variable names
############################################################################
## This has already been done as part of step 1


#############################################################################
## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
#############################################################################
meltDS <- melt(table, id=c("Subject_ID", "Activity"))
tidyDS <- dcast(meltDS, Subject_ID + Activity ~ variable, fun=mean)
##write.csv(tidyDS, "tidyData.csv", row.names=FALSE)
write.table(tidyDS, "tidyData.txt", row.names=FALSE, sep=" ")

message("Finished!")