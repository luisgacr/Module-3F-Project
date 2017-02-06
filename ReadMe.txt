==================================================================
Data Science - Module 3 - Cleaning Data - Project
Prepared by: Luis Gabriel Caro
Bogotá, Colombia
==================================================================

The data for the project was taken from Human Activity Recognition Using Smartphones Dataset, Version 1.0, developed by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

See licence information at the end of this document.

==================================================================
Source data set (brief description):

Complete information about the data set, and the data set itself, can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data set can also be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This brief description of the data set, and the experiment carried out to obtain it, is included to make the project understandable. However, the complete description, if needed, is found in the links mentioned above, or contact: activityrecognition@smartlab.ws.
 
As a summary, the purpose of the experiment was to determine the 3-axial linear acceleration and 3-axial angular velocity of an indivdual performing six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). For that purpose a a group of 30 volunteers within an age bracket of 19-48 years was selected. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist, that captured the desired results. The obtained dataset was randomly partitioned, by volunteers, into two sets: 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment. 

=============================================================================
Purpose of the project:

The purpose of the project is to create an R script file called analysis.R, that performs the following tasks:

1. Merges the training and test data sets to create one dataset.
2. Extracts only the measurements of the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second independent tidy data set with the average of each variable for each activity and subject.

==============================================================================
The project script is called: run_analysis.R  

Before running the script, the user must do 2 things:

1. Introduce his working directory in the first line of the script.
2. Download the following file to his working directory:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. Unzip the file, selecting: Extract to "getdata_projectfiles_UCI HAR Dataset". This generates a directory, called "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset", with all the required files.

NOTE: step 3 (unzip the file) apparently is not necessary if "unz" is used to extract the files from the .zip file. However I tried to use it, and it only worked for the root directory. I couldn´t get it to work for lower level directories. The lines used to try to get this files are included in the script, and to show the intention, the files activityLabels and and features, that are the only ones needed from the root directory are read into to dummy variables (dummyActivityLabels and dummyFeatures, that are never used), using "unz". The lines for the other files, that come from lower level directories are commented.


The script creates 2 variables:

- selectedMergedData: result of steps 1 thru 4.
- selectedMergedDataWithMeansByAandS: result of step 5.

These are the Tidy data principles, and an explanation as to how meansByActivityAndSubject complies with them:

1 - Each variable you measure should be in one column: each variable is in one column, and there is n column with more than one variable.

2 - Each different observation should be in a different row: the original rows, that were one for each observation, were preserved. 

3 - There should be one table for each kind of variable: here there is just one table, and all the variables are of the sema kind.

4 - If you have multiple tables they should include a column that allows them to be linked: no need because here there is only one table. 

5 - Include a row at the top of the file with variable names: there is a row at the top with variable names. 

6 - Make variable names readable and understandable: in step 4 of the project, everythong was labeled with descriptive named variables. The variable that the means requested in step preserve the same names with the suffix "SAMean" added.
 
7 - Save data in one file per table: : no need because here there is only one table. 

===============================================================================
For this project, the files used from the original data set, were:

- activityLabels: Links the class labels to their activity name (found at: "./UCI HAR Dataset/activity_labels.txt")

- features: List of all features (found at: "./UCI HAR Dataset/features.txt").

- testData: Test set, containing 2947 outcomes (one for each line), and each line is a 561-feature vector with time and frequency domain variables (found at: "./UCI HAR Dataset/test/X_Test.txt").

- activityTest: Contains 2947 activity codes, one for each line in testData, indicating to what type of actvity the outcome of each line corresponds (found at: "./UCI HAR Dataset/test/y_Test.txt")

- subjectTest: Contains 2947 subject codes, one for each line in testData, indicating to what what subject the outcome of each line corresponds (found at: "./UCI HAR Dataset/test/subject_Test.txt").

- trainData: Similar to testData, but for the train set, containing 7352 lines (found at: " ./UCI HAR Dataset/train/X_Train.txt")

- activityTrain: Similar to activityTest, but for the train set (found at: "./UCI HAR Dataset/train/y_Train.txt")

- subjectTrain: Similar to subjectTest, but for the train set (found at: "./UCI HAR Dataset/train/subject_Train.txt"

============================================================================================
Github repository for this project is:

https://github.com/luisgacr/Module-3-Project
============================================================================================
License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


