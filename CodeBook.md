# Getting and Cleaning Data Project - CodeBook.md

***

This codebook explains the variables in the the dataframe that is
produced by applying 'run_analysis.R' to the Human Activity Recognition Using Smartphones (HARUS) dataset. 

***

####Human Activity Recognition Using Smartphones (HARUS) Dataset
Version 1.0

***

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

##### Associated publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

####Raw Data

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

***


### Preface

***

The R script 'run_analysis.R' produces a space delimited text file 'tidyAverages.txt', with header, that contains a dataframe, which we will call 'tidyAverages'. The variables in the 'tidyAverages' dataframe are averages of certain variables in the HARUS dataset. Much of what appears below is adapted, with modifications, from the documentation included with the HARUS dataset. The file Readme.md includes a summary of the HARUS experiment. 

The 'tidyAverages' dataset includes the following variables; the first two variables correspond identically to variables in the HARUS experiment. 

### tidyAverages Variables

***

1. "participant" : (Categorical variable) A positive integer between 1 and 30, inclusive. The integer identifies a unique experiment participant.

2. "activity" : (Categorical variable) A string from the set {walking, walking upstairs, walking downstairs, sitting, standing, laying}. This variable indicates the task completed by the participant when the associated accelerometer and gyroscope readings were taken.

3. (66 Continuous Variables) The remaining 66 variables are averages of signal readings from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

    Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

    Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

    The mean and standard deviation of the recorded signals give rise to corresponding 'mean' and 'std' variables in the HARUS dataset. 
    
    Each variable name in the "HARUS variables" list below has a 'mean' and 'std' variation in the HARUS dataset created by simply appending 'mean()' or 'std()' to the end of the following variable names. The '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
    
    The variables in 'tidyAverages' are created from these HARUS variables in the following way. We remove all "-", ")", and "(" symbols, expand "Acc" to "Accelerometer", expand "Gyro" with "Gyroscope", replace "mean" with "Mean", and replace "std" with "StandardDeviation". For a given 'mean' or 'std' signal variable from the HARUS dataset, we compute the average of all entries in that variable for a fixed 'participant' and 'activity' value. The result is 66 continuous variables given in the "tidyAverages Variables" list below. 

*** 

#### HARUS Variables

***

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

***

#### Corresponding tidyAverages Variables

***

tBodyAccelerometerMeanX

tBodyAccelerometerMeanY

tBodyAccelerometerMeanZ

tBodyAccelerometerStandardDeviationX

tBodyAccelerometerStandardDeviationY

tBodyAccelerometerStandardDeviationZ

tGravityAccelerometerMeanX

tGravityAccelerometerMeanY

tGravityAccelerometerMeanZ

tGravityAccelerometerStandardDeviationX

tGravityAccelerometerStandardDeviationY

tGravityAccelerometerStandardDeviationZ

tBodyAccelerometerJerkMeanX

tBodyAccelerometerJerkMeanY

tBodyAccelerometerJerkMeanZ

tBodyAccelerometerJerkStandardDeviationX

tBodyAccelerometerJerkStandardDeviationY

tBodyAccelerometerJerkStandardDeviationZ

tBodyGyroscopeMeanX

tBodyGyroscopeMeanY

tBodyGyroscopeMeanZ

tBodyGyroscopeStandardDeviationX

tBodyGyroscopeStandardDeviationY

tBodyGyroscopeStandardDeviationZ

tBodyGyroscopeJerkMeanX

tBodyGyroscopeJerkMeanY

tBodyGyroscopeJerkMeanZ

tBodyGyroscopeJerkStandardDeviationX

tBodyGyroscopeJerkStandardDeviationY

tBodyGyroscopeJerkStandardDeviationZ

tBodyAccelerometerMagMean

tBodyAccelerometerMagStandardDeviation

tGravityAccelerometerMagMean

tGravityAccelerometerMagStandardDeviation

tBodyAccelerometerJerkMagMean

tBodyAccelerometerJerkMagStandardDeviation

tBodyGyroscopeMagMean

tBodyGyroscopeMagStandardDeviation

tBodyGyroscopeJerkMagMean

tBodyGyroscopeJerkMagStandardDeviation

fBodyAccelerometerMeanX

fBodyAccelerometerMeanY

fBodyAccelerometerMeanZ

fBodyAccelerometerStandardDeviationX

fBodyAccelerometerStandardDeviationY

fBodyAccelerometerStandardDeviationZ

fBodyAccelerometerJerkMeanX

fBodyAccelerometerJerkMeanY

fBodyAccelerometerJerkMeanZ

fBodyAccelerometerJerkStandardDeviationX

fBodyAccelerometerJerkStandardDeviationY

fBodyAccelerometerJerkStandardDeviationZ

fBodyGyroscopeMeanX

fBodyGyroscopeMeanY

fBodyGyroscopeMeanZ

fBodyGyroscopeStandardDeviationX

fBodyGyroscopeStandardDeviationY

fBodyGyroscopeStandardDeviationZ

fBodyAccelerometerMagMean

fBodyAccelerometerMagStandardDeviation

fBodyBodyAccelerometerJerkMagMean

fBodyBodyAccelerometerJerkMagStandardDeviation

fBodyBodyGyroscopeMagMean

fBodyBodyGyroscopeMagStandardDeviation

fBodyBodyGyroscopeJerkMagMean

fBodyBodyGyroscopeJerkMagStandardDeviation

