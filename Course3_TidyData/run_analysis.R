##'run_analysis.R' is meant to download a dataset, merge training and test data, 
## extract mean and std dev, label the data with variable names and create a
## tidy dataset for each  variable 

# Step 1: Download and unzip the dataset
if (!file.exists("UCI HAR Dataset")) {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)
  unzip(temp)
  unlink(temp)
}

# Step 2: Read the data files into R
# Features and activity labels
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))

# Training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")

# Test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")

# Step 3: Merge the training and test datasets
subject <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
all_data <- cbind(subject, y_data, x_data)

# Step 4: Extract measurements on mean and standard deviation
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
selected_data <- all_data[, c(1, 2, mean_std_features + 2)]

# Step 5: Use descriptive activity names
selected_data$activity <- factor(selected_data$activity, levels = activity_labels$id, labels = activity_labels$activity)

# Step 6: Label the dataset with descriptive variable names
colnames(selected_data)[3:ncol(selected_data)] <- features[mean_std_features, 2]
colnames(selected_data) <- gsub("[-()]", "", colnames(selected_data))
colnames(selected_data) <- gsub("mean", "Mean", colnames(selected_data))
colnames(selected_data) <- gsub("std", "Std", colnames(selected_data))

# Step 7: Create a tidy dataset with the average of each variable for each activity and each subject
library(dplyr)
tidy_data <- selected_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Step 8: Write the tidy data to a file
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
