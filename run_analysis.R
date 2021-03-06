#Change Directory
setwd("C:/Temp")

#Checking and creation of folder inside C:/Temp
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


#Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")


################################################################################
##1.Merges the training and the test sets to create one data set.

#Reading trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#Create 'x' data set
x_data <- rbind(x_train, x_test)

#Create 'y' data set
y_data <- rbind(y_train, y_test)

#Create 'subject' data set
subject_data <- rbind(subject_train, subject_test)


################################################################################
#2.Extracts only the measurements on the mean and standard deviation for each 
#measurement.

#Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]


###############################################################################
#3.Uses descriptive activity names to name the activities in the data set

#Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# update values with correct activity names
y_data[, 1] <- activityLabels[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

# correct column name
names(subject_data) <- "subject"


#4.Appropriately labels the data set with descriptive variable names.
###############################################################################

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)


###############################################################################
#5.From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

# 66 <- 68 columns but last two (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "tidy_data_set.txt", row.name=FALSE)

