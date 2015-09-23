
## Getting and cleaning data - Course Project ##

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained:  

[Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are the data for the project. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The unzipped dataset includes the following files:  

> - 'README.txt'  

> - 'features_info.txt': Shows information about the variables used on the feature vector.  

> - 'features.txt': List of all features.  

> - 'activity_labels.txt': Links the class labels with their activity name.  

> - 'train/X_train.txt': Training set.  

> - 'train/y_train.txt': Training activity labels.  

> - 'train/subject_train.txt': Training volunteers.

> - 'train/Inertial Signals/...: (Not used in this analysis)

> - 'test/X_test.txt': Test set.  

> - 'test/y_test.txt': Test activity labels. 

> - 'test/subject_train.txt': Test volunteers.

> - 'test/Inertial Signals/...: (Not used in this analysis)

The objective of this analysis is to get a clean and tidy data set from the training and the test sets that contains only the average on the mean and standard deviation for each measurement for each activity and subject.


## Processing Steps ##

All processing steps are performanced by **run_analysis.R** script. Steps and transformations are the following:

- Step 1: Load *reshape2* library for melting the data set in *step 9*.

- Step 2: Read all the training and test data sets into data frames.

- Step 3: Merge train and test x, y and subject data into separate data frames. 

- Step 4: Read feature.txt and perform several replacements on its values to ensure appropiate variable names for x data.

- Step 5: Rename all the data frame variables with descriptive names.

- Step 6: Merge all the data frames to create one data set.

- Step 7: Create a separate data set with the subject id, activity and measurements on the mean and standard deviation for each measurement. Every variable name that contains the words *mean* or *std* has been considered at this point, including angle variables.

- Step 8: Read activity_labels.txt and rename activities in the data set with descriptive activity names. At this point, all the data from our data set has been properly labeled.

- Step 9: Calculate an independent tidy data set with the average of each variable for each activity and subject, and subsequently, save the result *tidyData.csv* in the working directory.


## Output ##

The output file *tidyData.csv* contains 180 rows and 88 columns.  
It constains a summary of the *mean* and *standard deviation* of each measurement grouped by *subject* and *activity*. So the present variables are:
- [1] Subject_ID
- [2] Activity
- [3] tBodyAcc_Mean_X
- ....
- [88] angle(Z,gravityMean)

**Subject_ID**  
- Identifier of the volunteer that performed the experiment  
    1..30 (integer)  
      
**Activity**  
- Activity name that the volunteer was performing when data from accelerometer and gyroscope were extracted (factor)  
    1. WALKING  
    2. WALKING UPSTAIRS  
    3. WALKING_DOWNSTAIRS  
    4. SITTING  
    5. STANDING  
    6. LAYING  

**tBodyAcc_Mean_X .. angle(Z,gravityMean) (86 remaining variables)**
- Average mean and standard deviation of each measurement provided by sensors in X, Y and Z directions (numeric)  
    Signals are the following:  
    - tBodyAcc-XYZ
    - tGravityAcc-XYZ
    - tBodyAccJerk-XYZ
    - tBodyGyro-XYZ
    - tBodyGyroJerk-XYZ
    - tBodyAccMag
    - tGravityAccMag
    - tBodyAccJerkMag
    - tBodyGyroMag
    - tBodyGyroJerkMag
    - fBodyAcc-XYZ
    - fBodyAccJerk-XYZ
    - fBodyGyro-XYZ
    - fBodyAccMag
    - fBodyAccJerkMag
    - fBodyGyroMag
    - fBodyGyroJerkMag
    - angle(gravityMean)
    - angle(tBodyAccMean)
    - angle(tBodyAccJerkMean)
    - angle(tBodyGyroMean)
    - angle(tBodyGyroJerkMean)
