
#Code Book

##### This Code book is to know about the varaibles that used in the script(run_analysis) to clean up the data.

### ID Variables:
<table>
<tr>
<th>
Subject_no  
</th>
<th>Subject is from 1 to 30 number. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years</th>
</tr>
<tr>
<th>Activity_id</th>
<th>Activity is from 1 to 6. Each person performed six activities.</th>
</tr>
</table>
            

### Activty Variables:


<table>
<tr>
<th>Activity_id    </th>
<th>Activity is from 1 to 6. Each person performed six activities.</th>
</tr>
<tr>
<th>
Activity_label</th>
<th>The six activities are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING wearing a smartphone (Samsung Galaxy S II) on the waist</th>
</tr>
</table>

### Feature Variables:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAccmeanX <br/>
tBodyAccmeanY <br/>
tBodyAccmeanZ<br/>
tBodyAccstdX<br/>
tBodyAccstdY<br/>
tBodyAccstdZ<br/>
tGravityAccmeanX<br/>
tGravityAccmeanY<br/>
tGravityAccmeanZ<br/>
tGravityAccstdX<br/>
tGravityAccstdY<br/>
tGravityAccstdZ<br/>
tBodyAccJerkmeanX<br/>
tBodyAccJerkmeanY<br/>
tBodyAccJerkmeanZ<br/>
tBodyAccJerkstdX<br/>
tBodyAccJerkstdY<br/>
tBodyAccJerkstdZ<br/>
tBodyGyromeanX<br/>
tBodyGyromeanY<br/>
tBodyGyromeanZ<br/>
tBodyGyrostdX<br/>
tBodyGyrostdY<br/>
tBodyGyrostdZ<br/>
tBodyGyroJerkmeanX<br/>
tBodyGyroJerkmeanY<br/>
tBodyGyroJerkmeanZ<br/>
tBodyGyroJerkstdX<br/>
tBodyGyroJerkstdY<br/>
tBodyGyroJerkstdZ<br/>
tBodyAccMagmean<br/>
tBodyAccMagstd<br/>
tGravityAccMagmean<br/>
tGravityAccMagstd<br/>
tBodyAccJerkMagmean<br/>
tBodyAccJerkMagstd<br/>
tBodyGyroMagmean<br/>
tBodyGyroMagstd<br/>
tBodyGyroJerkMagmean<br/>
tBodyGyroJerkMagstd<br/>
fBodyAccmeanX<br/>
fBodyAccmeanY<br/>
fBodyAccmeanZ<br/>
fBodyAccstdX<br/>
fBodyAccstdY<br/>
fBodyAccstdZ<br/>
fBodyAccmeanFreqX<br/>
fBodyAccmeanFreqY<br/>
fBodyAccmeanFreqZ<br/>
fBodyAccJerkmeanX<br/>
fBodyAccJerkmeanY<br/>
fBodyAccJerkmeanZ<br/>
fBodyAccJerkstdX<br/>
fBodyAccJerkstdY<br/>
fBodyAccJerkstdZ<br/>
fBodyAccJerkmeanFreqX<br/>
fBodyAccJerkmeanFreqY<br/>
fBodyAccJerkmeanFreqZ<br/>
BodyGyromeanX<br/>
fBodyGyromeanY<br/>
fBodyGyromeanZ<br/>
fBodyGyrostdX<br/>
fBodyGyrostdY<br/>
fBodyGyrostdZ<br/>
fBodyGyromeanFreqX<br/>
fBodyGyromeanFreqY<br/>
fBodyGyromeanFreqZ<br/>
fBodyAccMagmean<br/>
fBodyAccMagstd<br/>
fBodyAccMagmeanFreq<br/>
fBodyBodyAccJerkMagmean<br/>
fBodyBodyAccJerkMagstd<br/>
fBodyBodyAccJerkMagmeanFreq<br/>
fBodyBodyGyroMagmean<br/>
fBodyBodyGyroMagstd<br/>
fBodyBodyGyroMagmeanFreq<br/>
fBodyBodyGyroJerkMagmean<br/>
fBodyBodyGyroJerkMagstd<br/>
fBodyBodyGyroJerkMagmeanFreq<br/>

The set of variables that were estimated from these signals are: 

mean: Mean value<br/>
std: Standard deviation

