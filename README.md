# Getting-and-Cleaning-Data-Course-Project
Peer-graded Assignment: Getting and Cleaning Data Course Project

This repository is all about creation of tidy data set using "Human Activity Recognition Using Smartphones Data Set".
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The goal of project is to create tidy data set with the average of each variable for each activity and each subject.

Here are the content of the repository:
- `README.md` = The file contains the goal of the repository.
- `CodeBook.md` = A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data
- `run_analysis.R` = The R script used in creating the tidy data set.
- `tidy_data_set.txt` = The tidy data set whic is an out put of the run_analysis.R.


# How the Script Works
The script contains the complete collection, working, and cleaning of data set. 
It was etup to first change the directory to C:/Temp that can be avialable to any computer which means it is possible to run any where.
Downloading of the files needed on the study is also included in this script as well as the checking and creation of folder inside C:/Temp
Finally is the unzipping of dataSet to /data directory

Below are the steps taken in creation of new and tidy data sets base on the downloaded files.
- Merging of training and test sets to create one data set by first reading the tables using the `read.table()` function. Then the creation of new data sets namely: (x_data, y_data, subject_data) using the `rbind()` function.
- Extracting only the measurements on the mean and standard deviation for each measurement using `read.table()` function in reading the `features.txt` vector, Also using `grep()` function this get the columns with mean() or std() in their names.
- Usage of descriptive activity names to name the activities in the data set by first reading activity labels using `read.table()`.
- Appropriately labeling the data set with descriptive variable names using `names()` and also merging all newly created data set to have one single data set for the last step.
- From the data set in step 4, creating a second, independent tidy data set  with the average of each variable for each activity and each subject using the funciton `ddply()` and also the creation of text file through `write.table()' function.

