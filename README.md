# Couresa Data Science - Getting and Cleaning Data Course Project

The purpose of this project is to getting and cleaning data from the data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Quickstart

1. Download the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the data set in any folder (e.g. C:\UCI HAR Dataset\) in your PC
3. Download the run_analysis.R script and MergedAverage.txt in the same folder of the data set
4. Open RStudio 
5. Change the working folder to the same folder of the data set

```R
> setwd("C:\UCI HAR Dataset\")
```

6. Run these commands:

```R
> source(run_analysis.R)
> dataset <- run_analysis()
```

7.  The processed result is stored in the dataset variable. You could view the variable as follow:

```R
> View(dataset)
```

## Project Contents

File | Description
-------- | -------------
run_analysis.R | The script to merged and average the collected data
CodeBook.md | Indicate all the variables and summaries calculated, along with units, and any other relevant information.
README.md | This file

## run_analysis.R()

### Description

This function imports the data collected from the accelerometers from the Samsung Galaxy S smartphone:
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

### Usage

```R
> run_analysis(path = ".", sets = c("test", "train"))
```

### Arguments

Argument | Description
-------- | -------------
path | The base path of the UCI HAR Dataset folder. The following folder structure are expected in order to import properly:<br />- 'features_info.txt': Shows information about the variables used on the feature vector<br />- 'features.txt': List of all features<br />- 'activity_labels.txt': Links the class labels with their activity name<br />- 'train/X_train.txt': Training set<br />- 'train/y_train.txt': Training labels<br />- 'test/X_test.txt': Test set<br />- 'test/y_test.txt': Test labels<br />- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
set | The set of data to import. By default, only the test and train set is available.

### Value

The average of each variable for each activity and each subject of the merged data set.
