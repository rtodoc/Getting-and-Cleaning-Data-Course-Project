# *Code Book* for Coursera Getting and Cleaning Data course project
Describing the variables, the data, and any transformations or work that you performed to clean up the data.

## Data Source
Data download: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip     
Full description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables Used
1. Merges the training and the test sets to create one data set.
- x_train = storage for reading x_train.txt
- y_train = storage for reading y_train.txt
- subject_train = storage for reading subject_train.txt
- x_test = storage for reading x_test.txt
- y_test = storage for reading y_test.txt
- subject_test = storage for reading subject_test.txt
- x_data = storage for combining x data set (x_train, x_test)
- y_data = storage for combining x data set (y_train, y_test)
- subject_data = storage for combining x data set (subject_train, subject_test)

2. Extracts only the measurements on the mean and standard deviation for each measurement.
- features = storage for reading the vector features.txt
- mean_and_std_features = storage for columns with mean or std in their names using Pattern Matching And Replacement (grep)

3. Uses descriptive activity names to name the activities in the data set
- activityLabels 


