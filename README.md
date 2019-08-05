# datasciencecoursera
This is a repository to record the project assignments for Data Science Specialization in COURSERA course.

The repository include the following project
-Coursera_course 1 project
-Coursera_course 3 prject: Getting and Cleanning Data


For Course 3 project: Getting and Cleaning Data

1. Download the analysis data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Getting and understanding data
Read in all the downloaded data and understand the data. By looking at the data, identify datasets that can be used for anlaysis. The datasets showed an experiment carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experiment captured 3-axial linear acceleration and 3-axial angular velocity The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

   By looking at data, get to know each of the datasets as below:
      -activity_labels: record the label of the 6 activities
  
      -features: record 561 features derived from raw measurments
  
      -feature_info: information on how the features are derived from raw measurements
  
      -inertial Signals: the raw data for test group or train group 
  
      -subject: the subjects records for test group or train group
  
      -X: the data records of all the 561 features for test group or train group
  
      -y: the data records of the 6 activities for test group or train group.

3. Cleaning the data
  -For test group (9 subjects), create ID variable in subject, Y dataset, and X dataset and merge them by ID variable.
  -For train group (21 subjects), create ID variable in subject, Y dataset, and X dataset and merge them by ID variable.
  -rbind() to combine records in test group and train group. 
  -so far, the dataset contains column: ID, SUBJECT, TEST, and 561 feature columns
  -use grep() to extract only the feature variables of mean and standard deviation
  -Use recode() to recode the TEST column into 6 labeled activities.
  -Craete final dataset containing columns as ID, SUBJECT, TEST, and the feature columns of mean and standard deviation. All columns are correctly labeled with descriptive column names.
  
  4. Create a second dataset with the average of each varible for per subject per activity using pipe and dplyr functions.
  
  


 
