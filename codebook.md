Coursera_Course 3 project codebook.

The submited dataset (daaset name: data_less) is a tidy dataset including 10299 rows and 81 columns. Each row is a record to record a series of measurements.

Here is the  description of all the columns.

  ID: the original sequential record number. This variable was used as an unique link ID to merge datasets.

  SUBJECT: the subject who paticipate the experiment.

  TEST: The 6 activities that each subject was tested on.

  column "tBodyAcc-mean()-X"" to "fBodyBodyGyroJerkMag-meanFreq()": The 79 feartures of mearsuments. The 79 features are selected   from 561 features of measurement containing only mean and standard deviation.


This tidy dataset was also used to create a second, independent tidy data set with the average of each variable for each activity and each subject. 
The name of the second dataset is data_avg.There are 180 rows (30 patients* 6 activities) and 81 columns.
In this dataset, each of the 79 feature variables was averaged by each subject and each activity. Missig values is remvoed during calculation.
