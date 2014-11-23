# Read the list of feature names; create unique and valid names for the columns
# of the data set - these are also used as the descriptive names for the 
# columns; also extract the names of the columns in which we are interested 
# (means and std devs)
feature_list <- read.table("UCI HAR Dataset/features.txt")
feature_names <- make.names(feature_list$V2)
measOfInterest <- grep("mean\\(\\)|std\\(\\)", feature_list$V2)

# Read in the training data set and label the columns with the descriptive 
# names generated above and extract the columns of interest. Add the activity and 
# subject data corresponding to this data set with appropriately descriptive 
# column names
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
colnames(X_train) <- feature_names
X_train <- X_train[,measOfInterest]
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
colnames(y_train) <- c("Activity")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
colnames(subject_train) <- c("Subject")
train_data <- cbind(subject_train, y_train, X_train)

# Read in the test data set and label the columns with the descriptive 
# names generated above and extract the columns of interest. Add the activity and 
# subject data corresponding to this data set with appropriately descriptive 
# column names
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
colnames(X_test) <- feature_names
X_test <- X_test[,measOfInterest]
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
colnames(y_test) <- c("Activity")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                           header = FALSE)
colnames(subject_test) <- c("Subject")
test_data <- cbind(subject_test, y_test, X_test)

# Merge the training and test data sets
har_data <- rbind(train_data, test_data)

# Replace the activity numbers in the merged data set with descriptive labels
activity_list <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_list) <- c("activity_id", "activity_name")
har_data$Activity <- factor(har_data$Activity, 
                            levels = as.character(activity_list$activity_id), 
                            labels = activity_list$activity_name)

# Create tidy data by taking the mean of the measurements for each subject for 
# each activity
library(data.table)
har_data_dt <- data.table(har_data)
tidy_har_data <- har_data_dt[,lapply(.SD,mean),by=list(Subject,Activity)]

# Write the tidy data out to file
write.table(tidy_har_data, file = "tidy_HAR_data.txt", row.names = FALSE)
