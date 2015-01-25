## Code Book 
### "act_subj_wform.txt" 

the dataset consists of 68 columns:

**activity**

Type of activity: "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS" 
        
**subject**

Subject number, from 1 to 30
        
**columns 3-68** are averages for each activity for each subject of so called "features" -  time and frequency domain variables calculated from raw data. 

**column name** |**pre-processing**| **description** | **units**
---|---|---|---|
tBodyAcc-XYZ         |time-domain|Body acceleration, X,Y,Z axes in separate columns|g
tGravityAcc-XYZ      |time-domain|Gravity acceleration, X,Y,Z axes in separate columns|g
tBodyAccJerk-XYZ     |time-domain|Body acceleration jerk, X,Y,Z axes in separate columns|g
tBodyGyro-XYZ        |time-domain|Body angular velocity, X,Y,Z axes in separate columns|radians/second
tBodyGyroJerk-XYZ    |time-domain|Body jerk angular velocity, X,Y,Z axes in separate columns|radians/second
tBodyAccMag          |time-domain|Body acceleration magnitude|g
tGravityAccMag       |time-domain|Gravity acceleration magnitude|g
tBodyAccJerkMag      |time-domain|Body acceleration jerk magnitude|g
tBodyGyroMag         |time-domain|Body angular velocit magnitude|radians/second
tBodyGyroJerkMag     |time-domain|Body jerk angular velocity magnitude|radians/second
fBodyAcc-XYZ         |FFT|Body acceleration, X,Y,Z axes in separate columns|g
fBodyAccJerk-XYZ     |FFT|Body acceleration jerk, X,Y,Z axes in separate columns|g
fBodyGyro-XYZ        |FFT|Body angular velocity, X,Y,Z axes in separate columns|radians/second
fBodyAccMag          |FFT|Body acceleration magnitude|g
fBodyAccJerkMag      |FFT|Body acceleration jerk magnitude|g
fBodyGyroMag         |FFT|Body angular velocit magnitude|radians/second
fBodyGyroJerkMag     |FFT|Body jerk angular velocity magnitude|radians/second

The set of variables that were estimated from the signals are: 

* mean(): Mean value
* std(): Standard deviation

###Description from original data set.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


