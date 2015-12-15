# Introduction #

The data being analysis names "Human Activity Recognition Using Smartphones Dataset (Version 1.0)", obtained from [Smartlab - Non Linear Complex Systems Laboratory](www.smartlab.ws) DITEN - Universit‡ degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy.

# Data Description #

## Activity ##
There are 6 activities defined for the experiment:  
1. WALKING  
2. WALKING_UPSTAIRS  
3. WALKING_DOWNSTAIRS  
4. SITTING  
5. STANDING  
6. LAYING  

## Input File ##
The following data files are used as input of the analysis: 

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

## Input columns ##

The dataset used in the analysis is a subset of the 561 features from the original dataset.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

*Notes:*  
- Features are normalized and bounded within [-1,1].  
- Each feature vector is a row on the text file.  

For more information about this dataset contact: [activityrecognition@smartlab.ws] (activityrecognition@smartlab.ws)

## Analysis step ##

1. Set the working directory.
2. Read both training and testing subject files, merge and assign to variable `subject` with column named **Subject**.  
3. Read both training and testing label files, merge and assign to varible `y` with column named **Y**.  
4. Read both training and testing measure files, merge and assign to variable `x` with column names defined by "features.txt".  
5. Associate the label data with corresponding activity descriptions, using "activity_labels.txt".  
6. Extracts only the measurements on the mean and standard deviation for each measurement.  
7. Combine the subject, label/activity, and selected measures as a single dataset.  
8. Meltdown the single data with IDs (**Subject**, **Y**, **Activity**) to obtain a tidy dataset  .
9. Calculate the mean of selected measures grouped by key = **Subject**, **Y**, **Activity**.  
10. Properly rename the new measures, and output the result as text file ("step5_ans.txt")

## Output columns ##

 Column                          | Meaning                                  | Type
 ------------------------------- | ---------------------------------------- | -------------
 Subject                         | ID of the experiment subject             | Factor (int)
 Y                               | Activity label                           | Factor (int)
 Activity                        | Activity description                     | Factor (char)
 AVG-fBodyAcc-mean()-X           | Average of "fBodyAcc-mean()-X"           | Numeric
 AVG-fBodyAcc-mean()-Y           | Average of "fBodyAcc-mean()-Y"           | Numeric
 AVG-fBodyAcc-mean()-Z           | Average of "fBodyAcc-mean()-Z"           | Numeric
 AVG-fBodyAcc-std()-X            | Average of "fBodyAcc-std()-X"            | Numeric
 AVG-fBodyAcc-std()-Y            | Average of "fBodyAcc-std()-Y"            | Numeric
 AVG-fBodyAcc-std()-Z            | Average of "fBodyAcc-std()-Z"            | Numeric
 AVG-fBodyAccJerk-mean()-X       | Average of "fBodyAccJerk-mean()-X"       | Numeric
 AVG-fBodyAccJerk-mean()-Y       | Average of "fBodyAccJerk-mean()-Y"       | Numeric
 AVG-fBodyAccJerk-mean()-Z       | Average of "fBodyAccJerk-mean()-Z"       | Numeric
 AVG-fBodyAccJerk-std()-X        | Average of "fBodyAccJerk-std()-X"        | Numeric
 AVG-fBodyAccJerk-std()-Y        | Average of "fBodyAccJerk-std()-Y"        | Numeric
 AVG-fBodyAccJerk-std()-Z        | Average of "fBodyAccJerk-std()-Z"        | Numeric
 AVG-fBodyAccMag-mean()          | Average of "fBodyAccMag-mean()"          | Numeric
 AVG-fBodyAccMag-std()           | Average of "fBodyAccMag-std()"           | Numeric
 AVG-fBodyBodyAccJerkMag-mean()  | Average of "fBodyBodyAccJerkMag-mean()"  | Numeric
 AVG-fBodyBodyAccJerkMag-std()   | Average of "fBodyBodyAccJerkMag-std()"   | Numeric
 AVG-fBodyBodyGyroJerkMag-mean() | Average of "fBodyBodyGyroJerkMag-mean()" | Numeric
 AVG-fBodyBodyGyroJerkMag-std()  | Average of "fBodyBodyGyroJerkMag-std()"  | Numeric
 AVG-fBodyBodyGyroMag-mean()     | Average of "fBodyBodyGyroMag-mean()"     | Numeric
 AVG-fBodyBodyGyroMag-std()      | Average of "fBodyBodyGyroMag-std()"      | Numeric
 AVG-fBodyGyro-mean()-X          | Average of "fBodyGyro-mean()-X"          | Numeric
 AVG-fBodyGyro-mean()-Y          | Average of "fBodyGyro-mean()-Y"          | Numeric
 AVG-fBodyGyro-mean()-Z          | Average of "fBodyGyro-mean()-Z"          | Numeric
 AVG-fBodyGyro-std()-X           | Average of "fBodyGyro-std()-X"           | Numeric
 AVG-fBodyGyro-std()-Y           | Average of "fBodyGyro-std()-Y"           | Numeric
 AVG-fBodyGyro-std()-Z           | Average of "fBodyGyro-std()-Z"           | Numeric
 AVG-tBodyAcc-mean()-X           | Average of "tBodyAcc-mean()-X"           | Numeric
 AVG-tBodyAcc-mean()-Y           | Average of "tBodyAcc-mean()-Y"           | Numeric
 AVG-tBodyAcc-mean()-Z           | Average of "tBodyAcc-mean()-Z"           | Numeric
 AVG-tBodyAcc-std()-X            | Average of "tBodyAcc-std()-X"            | Numeric
 AVG-tBodyAcc-std()-Y            | Average of "tBodyAcc-std()-Y"            | Numeric
 AVG-tBodyAcc-std()-Z            | Average of "tBodyAcc-std()-Z"            | Numeric
 AVG-tBodyAccJerk-mean()-X       | Average of "tBodyAccJerk-mean()-X"       | Numeric
 AVG-tBodyAccJerk-mean()-Y       | Average of "tBodyAccJerk-mean()-Y"       | Numeric
 AVG-tBodyAccJerk-mean()-Z       | Average of "tBodyAccJerk-mean()-Z"       | Numeric
 AVG-tBodyAccJerk-std()-X        | Average of "tBodyAccJerk-std()-X"        | Numeric
 AVG-tBodyAccJerk-std()-Y        | Average of "tBodyAccJerk-std()-Y"        | Numeric
 AVG-tBodyAccJerk-std()-Z        | Average of "tBodyAccJerk-std()-Z"        | Numeric
 AVG-tBodyAccJerkMag-mean()      | Average of "tBodyAccJerkMag-mean()"      | Numeric
 AVG-tBodyAccJerkMag-std()       | Average of "tBodyAccJerkMag-std()"       | Numeric
 AVG-tBodyAccMag-mean()          | Average of "tBodyAccMag-mean()"          | Numeric
 AVG-tBodyAccMag-std()           | Average of "tBodyAccMag-std()"           | Numeric
 AVG-tBodyGyro-mean()-X          | Average of "tBodyGyro-mean()-X"          | Numeric
 AVG-tBodyGyro-mean()-Y          | Average of "tBodyGyro-mean()-Y"          | Numeric
 AVG-tBodyGyro-mean()-Z          | Average of "tBodyGyro-mean()-Z"          | Numeric
 AVG-tBodyGyro-std()-X           | Average of "tBodyGyro-std()-X"           | Numeric
 AVG-tBodyGyro-std()-Y           | Average of "tBodyGyro-std()-Y"           | Numeric
 AVG-tBodyGyro-std()-Z           | Average of "tBodyGyro-std()-Z"           | Numeric
 AVG-tBodyGyroJerk-mean()-X      | Average of "tBodyGyroJerk-mean()-X"      | Numeric
 AVG-tBodyGyroJerk-mean()-Y      | Average of "tBodyGyroJerk-mean()-Y"      | Numeric
 AVG-tBodyGyroJerk-mean()-Z      | Average of "tBodyGyroJerk-mean()-Z"      | Numeric
 AVG-tBodyGyroJerk-std()-X       | Average of "tBodyGyroJerk-std()-X"       | Numeric
 AVG-tBodyGyroJerk-std()-Y       | Average of "tBodyGyroJerk-std()-Y"       | Numeric
 AVG-tBodyGyroJerk-std()-Z       | Average of "tBodyGyroJerk-std()-Z"       | Numeric
 AVG-tBodyGyroJerkMag-mean()     | Average of "tBodyGyroJerkMag-mean()"     | Numeric
 AVG-tBodyGyroJerkMag-std()      | Average of "tBodyGyroJerkMag-std()"      | Numeric
 AVG-tBodyGyroMag-mean()         | Average of "tBodyGyroMag-mean()"         | Numeric
 AVG-tBodyGyroMag-std()          | Average of "tBodyGyroMag-std()"          | Numeric
 AVG-tGravityAcc-mean()-X        | Average of "tGravityAcc-mean()-X"        | Numeric
 AVG-tGravityAcc-mean()-Y        | Average of "tGravityAcc-mean()-Y"        | Numeric
 AVG-tGravityAcc-mean()-Z        | Average of "tGravityAcc-mean()-Z"        | Numeric
 AVG-tGravityAcc-std()-X         | Average of "tGravityAcc-std()-X"         | Numeric
 AVG-tGravityAcc-std()-Y         | Average of "tGravityAcc-std()-Y"         | Numeric
 AVG-tGravityAcc-std()-Z         | Average of "tGravityAcc-std()-Z"         | Numeric
 AVG-tGravityAccMag-mean()       | Average of "tGravityAccMag-mean()"       | Numeric
 AVG-tGravityAccMag-std()        | Average of "tGravityAccMag-std()"        | Numeric

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit√† degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
==================================================================
==================================================================
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
