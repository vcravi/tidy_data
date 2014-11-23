#Tidy data creation from the UCI HAR data set [1]

This repo contains the course project for the Getting and Cleaning Data course.
It consists of 3 files as described below

1. README.md - this file

2. run_analysis.R - the script that actually does the data cleaning and tidying 
up and which is described in greater detail below

3. code_book.md - the code book describing the variables in the tidy data set

## Assumptions

The [UCI HAR dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
has been downloaded and unzipped in the folder containing the script.

## Operation of the script

The test and training data sets are loaded from file. The feature names are 
read from the file provided with the data sets and made unique for use as column 
names for the data sets. Further, the subset of columns of interest to this 
project, viz. the means and standard deviations of measurements, are also 
determined and extracted programmatically. There are a total of 66 columns of 
interest, identified by the mean() and std() functions being applied on 
measurements

The corresponding subject and activity data are read and added to the test and 
training data sets (with descriptive column names) by column binding. 

The test and training data sets are merged into a single data set by row binding. 

The numeric activity labels are converted to descriptive labels, by using 
factors, where the numeric activity id is used as the level and the text 
description of the activity is used as a label.

Thus far, all the processing has been done on a data frame; this is now 
converted to a data table and lapply used to collapse the data set to a set of 
averaged measurements for each subject for each activity. For 30 subjects 
involved in 6 activities, this resolves to a table with 180 rows.


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

