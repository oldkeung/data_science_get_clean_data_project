# Couresa Data Science - Getting and Cleaning Data Course Project

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

```R
source(run_analysis.R)
run_analysis()
```

## run_analysis.R()

### Description

This function imports the data
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Usage

```R
run_analysis(path = ".", sets = c("test", "train"))
```

### Arguments

Argument | Description
-------- | -------------
path | The base path of the UCI HAR Dataset folder. The following folder structure are expected in order to import properly:
| - 'features_info.txt': Shows information about the variables used on the feature vector.
| - 'features.txt': List of all features.
| - 'activity_labels.txt': Links the class labels with their activity name.
| - 'train/X_train.txt': Training set.
| - 'train/y_train.txt': Training labels.
| - 'test/X_test.txt': Test set.
| - 'test/y_test.txt': Test labels.
| - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
set | The set of data to import. By default, only the test and train set is available.

## Reference
