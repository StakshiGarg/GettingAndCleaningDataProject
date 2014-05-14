"subject": (Numeric)Subject on whom various data was recorded
"activity": (Character) Activity performed by subject (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING)
"tBodyAccMeanX" :(Numeric) Mean of tBodyAccMeanX
"tBodyAccMeanY" :(Numeric) Mean of tBodyAccMeanY
"tBodyAccMeanZ" :(Numeric) Mean of tBodyAccMeanZ
"tBodyAccStdX" :(Numeric) Mean of  tBodyAccStdX         
"tBodyAccStdY" :(Numeric) Mean of  tBodyAccStdY       
"tBodyAccStdZ" :(Numeric) Mean of tBodyAccStdZ
"tGravityAccMeanX" :(Numeric) Mean of tGravityAccMeanX
"tGravityAccMeanY" :(Numeric) Mean of tGravityAccMeanY
"tGravityAccMeanZ" :(Numeric) Mean of tGravityAccMeanZ
"tGravityAccStdX" :(Numeric) Mean of tGravityAccStdX
"tGravityAccStdY" :(Numeric) Mean of tGravityAccStdY
"tGravityAccStdZ" :(Numeric) Mean of tGravityAccStdZ
"tBodyAccJerkMeanX" :(Numeric) Mean of tBodyAccJerkMeanX
"tBodyAccJerkMeanY" :(Numeric) Mean of tBodyAccJerkMeanY
"tBodyAccJerkMeanZ" :(Numeric) Mean of tBodyAccJerkMeanZ
"tBodyAccJerkStdX" :(Numeric) Mean of tBodyAccJerkStdX
"tBodyAccJerkStdY" :(Numeric) Mean of tBodyAccJerkStdY
"tBodyAccJerkStdZ" :(Numeric) Mean of tBodyAccJerkStdZ
"tBodyGyroMeanX" :(Numeric) Mean of  tBodyGyroMeanX      
"tBodyGyroMeanY" :(Numeric) Mean of tBodyGyroMeanY
"tBodyGyroMeanZ" :(Numeric) Mean of tBodyGyroMeanZ
"tBodyGyroStdX" :(Numeric) Mean of tBodyGyroStdX
"tBodyGyroStdY" :(Numeric) Mean of tBodyGyroStdY
"tBodyGyroStdZ" :(Numeric) Mean of tBodyGyroStdZ
"tBodyGyroJerkMeanX" :(Numeric) Mean of tBodyGyroJerkMeanX
"tBodyGyroJerkMeanY" :(Numeric) Mean of tBodyGyroJerkMeanY
"tBodyGyroJerkMeanZ" :(Numeric) Mean of tBodyGyroJerkMeanZ
"tBodyGyroJerkStdX" :(Numeric) Mean of tBodyGyroJerkStdX
"tBodyGyroJerkStdY" :(Numeric) Mean of tBodyGyroJerkStdY
"tBodyGyroJerkStdZ" :(Numeric) Mean of tBodyGyroJerkStdZ
"tBodyAccMagMean" :(Numeric) Mean of tBodyAccMagMean
"tBodyAccMagStd" :(Numeric) Mean of tBodyAccMagStd
"tGravityAccMagMean" :(Numeric) Mean of tGravityAccMagMean
"tGravityAccMagStd" :(Numeric) Mean of tGravityAccMagStd
"tBodyAccJerkMagMean" :(Numeric) Mean of tBodyAccJerkMagMean
"tBodyAccJerkMagStd" :(Numeric) Mean of tBodyAccJerkMagStd
"tBodyGyroMagMean" :(Numeric) Mean of tBodyGyroMagMean
"tBodyGyroMagStd" :(Numeric) Mean of tBodyGyroMagStd
"tBodyGyroJerkMagMean" :(Numeric) Mean of tBodyGyroJerkMagMean
"tBodyGyroJerkMagStd" :(Numeric) Mean of tBodyGyroJerkMagStd
"fBodyAccMeanX" :(Numeric) Mean of fBodyAccMeanX
"fBodyAccMeanY" :(Numeric) Mean of fBodyAccMeanY
"fBodyAccMeanZ" :(Numeric) Mean of fBodyAccMeanZ
"fBodyAccStdX" :(Numeric) Mean of fBodyAccStdX
"fBodyAccStdY" :(Numeric) Mean of fBodyAccStdY
"fBodyAccStdZ" :(Numeric) Mean of fBodyAccStdZ
"fBodyAccJerkMeanX" :(Numeric) Mean of fBodyAccJerkMeanX
"fBodyAccJerkMeanY" :(Numeric) Mean of fBodyAccJerkMeanY
"fBodyAccJerkMeanZ" :(Numeric) Mean of fBodyAccJerkMeanZ 
"fBodyAccJerkStdX" :(Numeric) Mean of fBodyAccJerkStdX      
"fBodyAccJerkStdY" :(Numeric) Mean of fBodyAccJerkStdY   
"fBodyAccJerkStdZ" :(Numeric) Mean of fBodyAccJerkStdZ    
"fBodyGyroMeanX" :(Numeric) Mean of fBodyGyroMeanX    
"fBodyGyroMeanY" :(Numeric) Mean of fBodyGyroMeanY        
"fBodyGyroMeanZ" :(Numeric) Mean of fBodyGyroMeanZ         
"fBodyGyroStdX" :(Numeric) Mean of fBodyGyroStdX          
"fBodyGyroStdY" :(Numeric) Mean of fBodyGyroStdY         
"fBodyGyroStdZ" :(Numeric) Mean of fBodyGyroStdZ         
"fBodyAccMagMean" :(Numeric) Mean of fBodyAccMagMean        
"fBodyAccMagStd" :(Numeric) Mean of fBodyAccMagStd
"fBodyBodyAccJerkMagMean" :(Numeric) Mean of fBodyBodyAccJerkMagMean
"fBodyBodyAccJerkMagStd" :(Numeric) Mean of fBodyBodyAccJerkMagStd
"fBodyBodyGyroMagMean" :(Numeric) Mean of fBodyBodyGyroMagMean
"fBodyBodyGyroMagStd" :(Numeric) Mean of fBodyBodyGyroMagStd
"fBodyBodyGyroJerkMagMean" :(Numeric) Mean of fBodyBodyGyroJerkMagMean
"fBodyBodyGyroJerkMagStd" :(Numeric) Mean of fBodyBodyGyroJerkMagStd

Transformations: Change data type to numeric from scientific notation to number and then summarize returned data.
Details of transformation on each step is in script:
* load data
*trim spaces
*split each row on one or more space for data collected on each subject of activities in features
*change list of lists to data frames
*chnage column name from features set
*combine multiple data to form test data frame and train data frame
* change colomn names for subject and activity so that we can row wise bind frame
*Merges the training and the test sets to create one data set.
*Extracts only the measurements on the mean and standard deviation for each measurement. All such features have mean() or std() in their name 
*Change activity number to activity label
*Change column names to intercaps and remove - and ()
*Calculate means on each data group by subject and activity . Used Hmisc package