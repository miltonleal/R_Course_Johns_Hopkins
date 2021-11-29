library(data.table)

#Creates and set working directory

if (!dir.exists("Wearable Data")){
  dir.create("Wearable Data")
  setwd("Wearable Data")
}

##Download Data

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./UCI HAR Dataset.zip")){
  download.file(fileurl, "./UCI HAR Dataset.zip", method = "curl")
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}

#Read and Convert Data


features <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])

#Training Data

data.train.x <- read.table("./UCI HAR Dataset/train/X_train.txt")
data.train.y <- read.csv("./UCI HAR Dataset/train/Y_train.txt", header = FALSE)
data.train.z <- read.csv("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

data.train <- data.frame(data.train.z, data.train.y, data.train.x)
names(data.train) <- c(c("subject", "activity"), features)

#Test Data

data.test.x <- read.table("./UCI HAR Dataset/test/X_test.txt")
data.test.y <- read.csv("./UCI HAR Dataset/test/Y_test.txt", header = FALSE)
data.test.z <- read.csv("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

data.test <- data.frame(data.test.z, data.test.y, data.test.x)
names(data.test) <- c(c("subject", "activity"), features)

#Merged Data

data.train.test <- rbind(data.train, data.test)

#Extract mean and std features

mean.std.columns.index <- grep("mean|std", features)
data.selected <- data.train.test[, c(1,2, mean.std.columns.index + 2)]

#Inserting activity labels

activity.labels <- read.csv("./UCI HAR Dataset/activity_labels.txt", 
                            header = FALSE, sep = " ")
activity.labels <- as.character(activity.labels[,2])
data.selected$activity <- activity.labels[data.selected$activity]

#labeling variables

label.new <- names(data.selected)
label.new <- gsub("[(][)]", "", label.new)
label.new <- gsub("^t", "TimeDomain_", label.new)
label.new <- gsub("^f", "FrequencyDomain_", label.new)
label.new <- gsub("Acc", "Accelerometer_", label.new)
label.new <- gsub("Gyro", "Gyroscope_", label.new)
label.new <- gsub("Mag", "_Magnitude_", label.new)
label.new <- gsub("-mean-", "_Mean_", label.new)
label.new <- gsub("-std", "_StandarDeviation", label.new)
label.new <- gsub("-", "_", label.new)
label.new <- gsub("std", "StandardDeviation", label.new)
label.new <- gsub("mean", "Mean", label.new)
label.new <- gsub("MeanFreq", "Mean_Frequency", label.new)
label.new <- gsub("__", "_", label.new)
label.new <- gsub("BodyBody", "Body", label.new)
names(data.selected) <- label.new

#creating tidy dataset with average of each variable 
#for each activity and each subject

tidy.data <- aggregate(data.selected[,3:81], 
                       by = list(activity = data.selected$activity, 
                                 subject = data.selected$subject), 
                       FUN = mean)

write.table(x = tidy.data, file = "./UCI HAR Dataset/tidy.data.txt", row.names = FALSE)







