# gettingandcleaningdata
repository for the Getting and Cleaning Data assignment (coursera)

## Purpose of the script
The R-script is meant to do the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The script saves both the dataset from step 4 and the dataset from step 5.

## Using the script
1. Download the dataset [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip.
2. Change working directory (in R) in such a way that the folder 'UCI HAR Dataset' can be attained.
3. Run the script.
4. The full dataset is recorded as *AllData.txt*, the average data set is recorded as *AverageData.txt*.

## Content of the script
1. Attach necessary packages: dplyr, tidyr.
2. Uses the files 'features.txt' and 'activity_labels.txt' to create lists with generic information about both data sets.
3. Defines a function which creates a tidy data set for a given directory (in this case we are interested 'train' and 'test').  
  The data is enriched with the activity labels and names for the measurements as determined in step 2.  
  Then the kind of measurement (e.g. tBodyGyroJerk-mean-X) is cast into 3 columns: **kind** tBodyGyroJerk, **moment** mean and **dimension** X.
4. The function is used to read data from both folders, then the data is merged.
5. The full dataset is then summarized on the various kinds (subject, activity, kind, moment, dimension) to create the second dataset.

## Why is the data tidy?
Each column contains only one variable.  
Different kinds of measurement (e.g. tBodyGyroJerk for different dimensions) are recorded in different rows (note: it can be debated if these are actually different records).  
There is only one kind of observational unit and hence one table.
