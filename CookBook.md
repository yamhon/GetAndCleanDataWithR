## Output columns ##

 Column   | Meaning                       | Type      | Possible value
 -------- | ----------------------------- | --------- | ----------------
 Subject  | ID of the experiment subject  | Integer   | 1 : 30
 Activity | Activity description          | Character | Walking, Walking_upstairs, Walking_downstairs, Sitting, Standing, Laying
 Domain   | Domain of feature measurement | Factor    | Time / Frequency
 Feature  | Subset of original features   | character | *ref below*
 Average  | Average value of Feature      | numeric   | -1 : +1

 The full list of Feature is given as follow:  

  Feature                   | Feature                    | Feature
  ------------------------- | -------------------------- | --------------------------
  BodyAcc-mean()-X          | BodyAcc-mean()-Y           | BodyAcc-mean()-Z          
  BodyAcc-std()-X           | BodyAcc-std()-Y            | BodyAcc-std()-Z           
  BodyAccJerk-mean()-X      | BodyAccJerk-mean()-Y       | BodyAccJerk-mean()-Z      
  BodyAccJerk-std()-X       | BodyAccJerk-std()-Y        | BodyAccJerk-std()-Z       
  BodyAccMag-mean()         | BodyAccMag-std()           | BodyBodyAccJerkMag-mean() 
  BodyBodyAccJerkMag-std()  | BodyBodyGyroJerkMag-mean() | BodyBodyGyroJerkMag-std() 
  BodyBodyGyroMag-mean()    | BodyBodyGyroMag-std()      | BodyGyro-mean()-X         
  BodyGyro-mean()-Y         | BodyGyro-mean()-Z          | BodyGyro-std()-X          
  BodyGyro-std()-Y          | BodyGyro-std()-Z           | BodyAccJerkMag-mean()     
  BodyAccJerkMag-std()      | BodyGyroJerk-mean()-X      | BodyGyroJerk-mean()-Y     
  BodyGyroJerk-mean()-Z     | BodyGyroJerk-std()-X       | BodyGyroJerk-std()-Y      
  BodyGyroJerk-std()-Z      | BodyGyroJerkMag-mean()     | BodyGyroJerkMag-std()     
  BodyGyroMag-mean()        | BodyGyroMag-std()          | GravityAcc-mean()-X       
  GravityAcc-mean()-Y       | GravityAcc-mean()-Z        | GravityAcc-std()-X        
  GravityAcc-std()-Y        | GravityAcc-std()-Z         | GravityAccMag-mean()      
  GravityAccMag-std()       |                             |
 