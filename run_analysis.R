library("data.table")
library(plyr) #<---------------------------------------------plyr library

#add activity names to the data frame and place them in column 1
selectedTestData$activity<-testActivityStringLabels 
x <- "activity"
selectedTestData<-selectedTestData[c(x, setdiff(names(selectedTestData), x))]

#add subject number to the data frame and place them in column 1
selectedTestData$subject<-subjectTest[,1] #--------------------------------------------add columns
x<-"subject"
selectedTestData<-selectedTestData[c(x, setdiff(names(selectedTestData), x))]

trainData<-read.table("./Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_Train.txt")
activityTrain <-read.table("./Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_Train.txt")
subjectTrain <-read.table("./Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_Train.txt")

#changes testData Column names to features
names(trainData)<-features[,2]

#selectedTestData: data frame with only the columns that have "mean()" or "std()" in the column name
selectedTrainData<-trainData[columnsToKeep]

#activity names for each row of the data frame
trainActivityStringLabels<-activityLabels[activityTrain[,1],2]

#add activity names to the data frame and place them in column 1
selectedTrainData$activity<-trainActivityStringLabels 
x <- "activity"
selectedTrainData<-selectedTrainData[c(x, setdiff(names(selectedTrainData), x))]

#add subject number to the data frame and place them in column 1
selectedTrainData$subject<-subjectTrain[,1] #--------------------------------------------add columns
x<-"subject"
selectedTrainData<-selectedTrainData[c(x, setdiff(names(selectedTrainData), x))]

selectedData<-rbind(selectedTrainData,selectedTestData)

dataMelt<-melt(selectedData,id=c("subject","activity"),measure.vars = features[,2][columnsToKeep])
dataMelt
meansByActivityAndSubject<-dcast(dataMelt, activity + subject ~ variable, mean)

head(meansByActivityAndSubject)

#(((((((((((((((((((((((((())))))))))))))))))))))))))

library(plyr) #<---------------------------------------------plyr library

setwd("D:/ApplicationFiles/Aprendizaje/DataScience/DataScience/Module 3")

#loading files directly from website and zip file (this is not used, it is just to show that there was intention to use it, please see ReadMe.txt) for details about this.
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","./Project/zip1") #<---- works
#dummyActivityLabels<-read.table(unz(description="./Project/zip1", filename = "UCI HAR Dataset/activity_labels.txt")) #<-------- works
#dummYfeatures<-read.table(unz("./Project/zip1", "UCI HAR Dataset/features.txt"))  #<------------------------------------------- works
#testData<-read.table(unz(description="./Project/zip1", filename = "UCI HAR Dataset/test/X_Test.txt"))  #<--------------- doesn't work
#trainData<-read.table(unz(description="./Project/zip1", filename = "UCI HAR Dataset/train/X_Train.txt"))  #<------------ doesn't work
#activityTest<-read.table(unz("./Project/zip1", "UCI HAR Dataset/test/y_Test.txt"))  #<---------------------------------- doesn't work
#activityTrain <-read.table(unz("./Project/zip1","UCI HAR Dataset/train/y_Train.txt")  #<-------------------------------- doesn't work
#subjectTest<-read.table(unz("./Project/zip1","UCI HAR Dataset/test/subject_Test.txt")  #<------------------------------- doesn't work
#subjectTrain <-read.table(unz("./Project/zip1","UCI HAR Dataset/train/subject_Train.txt")  #<--------------------------- doesn't work

activityLabels<-read.table("./Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
features<-read.table("./Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

#loading files from working directory (please see description of each file in ReadMe.txt)
testData<-read.table("./Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_Test.txt")
activityTest<-read.table("./Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_Test.txt")
subjectTest<-read.table("./Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_Test.txt")
trainData<-read.table("./Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_Train.txt")
activityTrain <-read.table("./Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_Train.txt")
subjectTrain <-read.table("./Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_Train.txt")

#STEP 1 start: merge trainData and testData<------------------------------------------------------------------------------- STEP 1 start
mergedData<-rbind(trainData,testData)

#The following commented lines can be useful for testing results of step 1
#dim(testData)
#dim(trainData)
#dim(mergedData)
#head(trainData)
#head(mergedData)
#tail(testData)
#tail(mergedData)
#STEP 1 finish: merge trainData and testData<------------------------------------------------------------------------------ STEP 1 finish

#STEP 2 start: Extracts only the measurements of the mean and standard deviation for each measurement --------------------- STEP 2 Start

#numbers of the columns that have "mean()" or "std()" in the column name (this was my understanding of whatwas being required)
columnsToKeep<-grep("mean\\(\\)|std\\(\\)",features$V2)

#selectedMergedData: data frame with only the columns that have "mean()" or "std()" in the column name
selectedMergedData<-mergedData[columnsToKeep]

#The following commented lines can be useful for testing results of step 2
#dim(mergedData)
#head(mergedData)
#dim(selectedMergedData)
#head(selectedMergedData)
#STEP 2 finish: Extracts only the measurements of the mean and standard deviation for each measurement -------------------- STEP 2 finish

#STEP 3 start: Use descriptive activity names to name the activities in the data set -------------------------------------- STEP 3 Start

#activity names for each row of the data frame
mergeActivityStringLabels<-activityLabels[c(activityTrain[,1],activityTest[,1]),2]

#add activity names to the data frame and place them in column 1
selectedMergedData$activity<-mergeActivityStringLabels 
x <- "activity"
selectedMergedData<-selectedMergedData[c(x, setdiff(names(selectedMergedData), x))]

#The following commented lines can be useful for testing results of step 3
#head(activityTrain)
#tail(activityTest)
#head(activityLabels)
#head(selectedMergedData)
#tail(selectedMergedData)
#STEP 3 finish: Use descriptive activity names to name the activities in the data set -------------------------------------- STEP 3 Finish

#STEP 4 start: Appropriately labels the data set with descriptive variable names ------------------------------------------- STEP 4 Start

#Features contains the names of the columns in mergedData (trainData + testData)
#These names ara assigned as column names in mergedData
names(selectedMergedData)[2:ncol(selectedMergedData)]<-as.character(features[columnsToKeep,2])


#The following commented lines can be useful for testing results of step 4
#head(selectedMergedData)
#STEP 4 finish: Appropriately labels the data set with descriptive variable names ------------------------------------------- STEP 4 Finish

#STEP 5 start: From the data set in step 4, creates a second independent tidy data set 
#              with the average of each variable for each activity and subject ---------------------------------------------- STEP 5 Start

#subject codes for each row of selectedMergedData
mergedSubjectCodes<-c(subjectTrain[,1],subjectTest[,1])

#add subject number to selectedMergedData and place them in column 1
selectedMergedData$subject<-mergedSubjectCodes #--------------------------------------------add columns
x<-"subject"
selectedMergedData<-selectedMergedData[c(x, setdiff(names(selectedMergedData), x))]

#convert selectedMegeddData into data.table, en calculate the means for each value grouped by
#   subject and activity. These mean are added to each observation as new columns.
#The new columns (means) names are the same names of the original value columns names with "_SAMean" added at the end. 
sdcols <- names(selectedMergedData)[-2:-1]      ## A vector of the new columns we want to add
sdcols
selectedMergedDataWithMeansByAandS<-as.data.table(selectedMergedData)
selectedMergedDataWithMeansByAandS[, paste(sdcols, "SAMean", sep = "_") := lapply(.SD, mean), 
                                by = list(subject,activity)][] 



#The following commented lines can be useful for testing results of step 5
#head(subjectTrain)
#head(selectedMergedData)
#tail(subjectTest)
#tail(selectedMergedData)
#names(selectedMergedDataWithMeansByAandS) 
#dim(selectedMergedDataWithMeansByAandS)
#STEP 5 finish: From the data set in step 4, creates a second independent tidy data set 
#              with the average of each variable for each activity and subject ---------------------------------------------- STEP 5 finish


