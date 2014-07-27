## 0. making sure necessary packages are installed
## reshape2 is used to perform grouping and averaging.

if (!require("data.table")) {
  install.packages("data.table")
}
if (!require("reshape2")) {
  install.packages("reshape2")
}
require("data.table")
require("reshape2")

## 1. Merges the training and the test sets to create one data set.

train <- read.table("./UCI HAR Dataset/train/X_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
XX <- rbind(train, test)

train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
Sbjct <- rbind(train, test)

train <- read.table("./UCI HAR Dataset/train/y_train.txt")
test <- read.table("./UCI HAR Dataset/test/y_test.txt")
YY <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./UCI HAR Dataset/features.txt")[,2]
req_feat <- grepl("mean|std", features)
XX <- XX[, req_feat]
names(XX)<-features[req_feat]

# 3. Uses descriptive activity names to name the activities in the data set

acti <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
YY[,2] <- acti[YY[,1]]
names(YY) = c("Activity_ID", "Activity_Label")

# 4. Appropriately labels the data set with descriptive activity names.

names(Sbjct) <- "subject"

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

clean_data <- cbind(Sbjct, YY, XX)

req_cols = c("subject", "Activity_ID", "Activity_Label")
req_data = setdiff(colnames(clean_data), req_cols)
melted_data = melt(clean_data, id = req_cols, measure.vars = req_data)
tidy_set = dcast(melted_data, subject + Activity_Label ~ variable, mean)
write.table(tidy_set, file = "./tidy_data.txt")
