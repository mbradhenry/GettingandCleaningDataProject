# Getting and Cleaning Data Project - README.md


***

This README summarizes the Human Activity Recognition Using Smartphone (HARUS) experiment and outlines the steps employed by 'run_analysis.R' to produce a tidy dataset from the HARUS datasets.

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

###Summary of the HARUS Experiment 
####Largely adapted from the HARUS dataset Readme.txt

*** 

We will abbreviate "Human Activity Recognition Using Smartphone" by HARUS. The R script 'run_analysis.R' produces a space delimited text file 'tidyAverages.txt', with header, that contains a dataframe, which we will call 'tidyAverages'. The variables in the 'tidyAverages' dataframe are averages of certain variables in the HARUS dataset. Much of what appears below is adapted, with modifications, from the documentation included with the HARUS dataset.

The HARUS dataset is the result of a experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the HARUS team captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of numerics was obtained by calculating variables from the time and frequency domain.

###Steps performed by 'run_analysis.R'

***
We assume that the raw data file has been downloaded from the source provided above, the zip file has been extracted, and the working directory in R has been set to the top level directory extracted from the zip file. The file 'run_analysis.R' was written in R version 3.1.2 (2014-10-31) on a computer running Mac OS X 10.10.2 and requires the library 'reshape2'.

1. Read the HARUS datasets 'test.txt' and 'train.txt' into R, thereby creating dataframes 'dataTest' and 'dataTrain'.

2. Read the HARUS dataset 'features.txt' into R, thereby creating the dataframe 'variableNames'. The second column of 'variableNames' contains the variable names of 'dataTest' and 'dataTrain'. Extract this second column as a character vector also named 'variableNames'. Use the vector 'variableNames' to change the variable names of 'dataTest' and 'dataTrain'. We will improve these variable names later. 

3. Remove from 'dataTest' and 'dataTrain' all variables, except those whose name includes 'std()' or 'mean()'. Note that variables including the string 'meanFreq' are also removed.

4. The HARUS datasets 'subject_test.txt' and 'subject_train.txt' give the participant identification number for each row of 'dataTest' and 'dataTrain'. We extract a vector from these files and add the vector as a new variable 'participant' in 'dataTest' and 'dataTrain'.

5. The HARUS files 'Y_test.txt' and 'Y_train.txt' give the activity identification number for each row of 'dataTest' and 'dataTrain'. We extract a vector from these files and add the vector as the new variable 'activity' in 'dataTest' and 'dataTrain'.

6. Append the rows of 'dataTrain' to 'dataTest' with rbind, thereby creating a dataframe 'mergedData' containing both data sets.

7. Improve the readability of the variable names in 'mergedData' as follows: 
    a. Removing all occurrences of "-", "(", and "(". 
    b. Replace "Acc" with "Accelerometer"
    c. Replace "Gyro" with "Gyroscopte"
    d. Replace "mean" with "Mean"
    e. Replace "std" with "StandardDeviation"

8. Translate entries in 'activity' from integers between 1 and 6, inclusive, into one of the following strings: "walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying".

9. Melt the dataframe 'mergedData' with id's 'participant' and 'activity' and measure variables the remaining 66 variables of 'mergedData'. We melt the data so that we can apply 'dcast' and create a dataframe 'avgData' containing the average value of each measure variable for every combination of 'participant' and 'activity' values. 

10. Write the 'avgData' dataframe to the file 'tidyAverages.txt'. This creates a space delimited text file, which includes a header of variable names and  one row for each row of 'tidyAverages'. To read this data into R use the command: 

```R
read.table("tidyAverages.txt",header=TRUE)
```