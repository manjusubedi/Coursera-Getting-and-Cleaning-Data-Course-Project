
## Project Description
In this project the raw data is given and tidy data will be the output. The process of collecting the raw data, steps in the making of tidy dataset, description of the variables in the tidy dataset, values on the each variables will be the main contents of this codebook. 

## Study design 
The experiments have been carried out with a group of 30 volunteers. Each person wearing a smartphone (Samsung Galaxy S II) on the waist performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

## Collection of the raw data
Raw dataset used in this project can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), the original dataset is taken from [UCI Machne Learning Repositoty](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.)

During the experement each subject (30 volunteers) are performing the six activities, the experiments have been video-recorded to label the data manually. Two sets of data has been created using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Creating the tidy datafile

From a large data file  (containing total 10299 observations on 561 measurement variables), columns are selected with the measurements on the mean and standard deviation for each measurement. Out of 561 columns 66 columns are with mean and standard deviation on all 10299 observations.
Two columns are added for the activity labels and subject ID.
Finally, tidy data set is average of the measurement on each subject and each activities.  That is 180 observation (from 30 subjects and on each six activities)  of 68 variables. 

**Guide to create the tidy data file**

1.download the data from the link given above.

2. unzip the files and save the txt files in the working directory. The subfolder "Inertial Signals" will not be used in this study.

3. Merges the training and the test sets to create one data set.

4. Extracts only the measurements on the mean and standard deviation for each measurement.

5. Uses descriptive activity names to name the activities in the data set.

6. Appropriately labels the data set with descriptive variable names.

7. From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The steps given above on the raw datasets processed with the script [run_analysis.R](https://github.com/manjusubedi/Coursera-Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R) to create a tidy data set. 

## Description of the variables in the tidy datafile
The tidy data set contains :
Subject ID for each subject who carried out the experiment is in the first column named "subject" that is in the range from 1 to 30. An activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING is in  the second column named "activity". Each column after that contains the average of each variables on corresponding activity of corresponding subject (person).

The variable name convention is like the following:

Measurement: Three dimensional (XYZ) signals were measured,the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerkMean-XYZ, timeBodyAccJerkStd-XYZ and timeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMagnitudeMean, timeBodyAccMagnitudeStdDev, timeGravityAccMagnitudeMean, timeGravityAccMagnitudeStdDev,timeBodyAccJerkMagnitudeMean, timeBodyAccJerkMagnitudeStdDev timeBodyGyroMagnitudeMean, timeBodyGyroMagnitudeStdDev, timeBodyGyroJerkMagnitudeMean, timeBodyGyroJerkMagnitudeStdDev).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing the variables named freqBodyAccMean-XYZ, freqBodyAccstd-XYZ, freqBodyAccJerkMean-XYZ, freqBodyAccJerkstd-XYZ, freqBodyGyroMean-XYZ, freqBodyGyrostd-XYZ, freqBodyAccMagnitudeMean,freqBodyAccMagnitudeStdDev, freqBodyAccJerkMagnitudeMean, freqBodyAccJerkMagnitudeStdDev, freqBodyGyroMagnitudeMean, freqBodyGyroMagnitudeStdDev, freqBodyGyroJerkMagnitudeMean, freqBodyGyroJerkMagnitudeStdDev. 

The numerical values are the global mean value of each variable on each activity of corresponding subjects. 
Mean/Std: mean or standard deviation of the measurement
X/Y/Z: direction of a 3-axial signal
Class of the activity is character, class of subject is integer and all other 66 variables are "numeric"  
Dimension of the tidy data file is 180 by 68.


