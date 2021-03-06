# GetAndCleanDataWithR #

This repository contains code implementing a simple data analysis using R, which fulfills a project submission requirement of the Coursera course: Getting and Cleaning Data  
(by Bloomberg School of Public Health, Johns Hopkins University)

Files contained in this repository:

1. This README
2. A [R script][1] used for analysis.
3. A [CookBook][2] describing output file.

[1]: run_analysis.R "R-script"
[2]: CookBook.md "CookBook"

## Overview ##

The data being analysis names "Human Activity Recognition Using Smartphones Dataset (Version 1.0)", obtained from [Smartlab - Non Linear Complex Systems Laboratory](http://www.smartlab.ws) DITEN - UniversitÓ degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy.

Reference:  

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Experiment description ##

Quoted from the original readme.txt included in the dataset:  
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz are captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.  

## Input Files ##

The following files are used as input of the analysis: 

 File                    | Description
 ------------            | -----------
 features.txt            | List of all features.
 activity_labels.txt     | Links the class labels with their activity name.
 train/subject_train.txt | Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
 train/X_train.txt       | Training set.
 train/y_train.txt       | Training labels.
 test/subject_test.txt   | Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
 test/X_test.txt         | Test set.
 test/y_test.txt         | Test labels.

## Features ##

Quoted from the original features_info.txt:  
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

> The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

> The complete list of variables of each feature vector is available in 'features.txt'

*Notes:*  
- Features are normalized and bounded within [-1,1].  
- Each feature vector is a row on the text file.  

For more information about this dataset contact: activityrecognition@smartlab.ws

## Analysis steps ##

0. Required packages: **data.table**, **tidyr**, **dplyr**
1. Setup environment: 
    + Set working directory;
    + Define a function `readData` for _step 1_.  
2. _(Step1)_ Read and merge the traing and testing data  
    2.1 Subject: assign to variable `subject` with column named **Subject**.  
    2.2 Label: assign to varible `y` with column named **Y**.  
    2.3 Measure: assign to variable `x` with column names defined by "features.txt".  
    2.4 Column-binded the three data set `subject`, `y` and `x`, and assigned to `combined`.  
3. _(Step2)_ Extracts only the measurements on the mean and standard deviation for each measurement, and assigned to `selected`.  
    3.1 A total of 66 features are selected
4. _(Step3)_ Match the activity labels to the corresponding descriptions (using "activity_labels.txt") and assign to `labelled`.  
    4.1 Original activity code (column **Y**) is replaced by the descriptions (column **Activity**).  
5. _(Step4)_ Tidyup the data with keys = (**Subject**, **Activity**), and assign to `melten`.  
6. _(Step5)_ Calculate the mean of selected measures grouped by the key = **Subject**, **Activity**.  
    6.1 Extract signal domain (Time/Frequency) from the feature name.  
    6.2 Output the result as text file ("step5_ans.txt") 

## Possible improvement ##

 1. Further separation of `Feature` into `variable`, `statistics` (mean or std), and `axis` (x, y, z, all)
