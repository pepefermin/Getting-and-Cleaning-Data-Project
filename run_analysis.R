## Read feature file
features <- read.table("UCI HAR Dataset/features.txt", header = F)

## Extract positions of features on mean and std
MeanStdPos <- sort(grep("mean|std", features$V2))
## Take variable names associated with mean and std
MeanStdNames <- features$V2[MeanStdPos]

## Read datasets
XTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = F)
YTrain <- read.table("UCI HAR Dataset/train/Y_train.txt", header = F)
XTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = F)
YTest <- read.table("UCI HAR Dataset/test/Y_test.txt", header = F)

## Extract only relevant measurements
XTrain <- XTrain[, MeanStdPos]; XTest <- XTest[, MeanStdPos]

## Combine train and test sets
X <- rbind(XTrain,XTest); Y <- rbind(YTrain, YTest)

## Name columns
names(X) <- MeanStdNames
names(Y) <- "ActivityId"

## Read subject file
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = F)
SubjectTest <-read.table("UCI HAR Dataset/test/subject_test.txt", header = F)
Subject <- rbind(SubjectTrain, SubjectTest)
names(Subject) = "Subject"

## Combine Signals, activity ID, Subject
Signals <- data.frame(c(X, Y, Subject))

## Read activity labels
ActivityLabel <- read.table("UCI HAR Dataset/activity_labels.txt", header = F)
names(ActivityLabel) <- c("ActivityId", "Activity")

## Merge in activity labels into main dataset
ActivitySignals <- merge(Signals, ActivityLabel, by = "ActivityId")

## Compute averages
library(plyr)
ActivitySignals$Subject <- as.factor(ActivitySignals$Subject)
SignalAverage <- aggregate(ActivitySignals[, 2:80], by = list(ActivitySignals$Activity,ActivitySignals$Subject), mean)
names(SignalAverage)[1:2] <- c("Activity", "Subject")

## Write tidy dataset
write.table(SignalAverage, file = "tidy_data.txt", row.names = F)