## Codebook for the AverageData.txt file
The data in the file AverageData.txt file form a summarized version of the data in [Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data originates in measurements from the accelerometer and gyroscope signals on smartphones, recorded while subjects were performing specific activities.
For each measurement, both the mean ('mean') and the standard deviation ('std') have been recorded. 
The file consists of the following variables:
1. **Subject**: The measurements were performed on 30 (anonymous) subjects. This variable has integer values (1-30) indicating the subject.
2. **Activity**: The measurements were performed during one of six activities. This variable describes the activity as either: 
LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS or WALKING_UPSTAIRS.
3. **kind**: The measurements were taken for the following quantities:  
  i. tBodyAcc-XYZ  
  ii. tGravityAcc-XYZ  
  iii. tBodyAccJerk-XYZ  
  iv. tBodyGyro-XYZ  
  v. tBodyGyroJerk-XYZ  
  vi. tBodyAccMag  
  vii. tGravityAccMag  
  viii.tBodyAccJerkMag  
  ix. tBodyGyroMag  
  x. tBodyGyroJerkMag  
  xi. fBodyAcc-XYZ  
  xii. fBodyAccJerk-XYZ  
  xiii. fBodyGyro-XYZ  
  xiv. fBodyAccMag  
  xv. fBodyAccJerkMag  
  xvi. fBodyGyroMag  
  xvii. fBodyGyroJerkMag  
Where '-XYZ' indicates that the variable is recorded for the X, Y and Z-dimensions (separately).
4. **moment**: either 'mean' or 'std' for mean or standard deviation.
5. **dimension**: for the variables ending in '-XYZ', this indicates which of X, Y or Z dimension is recorded, and is NA for all other variables.
6. **average**: the average mean or standard deviation for the given subject, activity, measurement, given the original data set. 
Data was normalized to [-1:1] in the original set and this is still the case (as it is an average of normalized data).

