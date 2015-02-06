## Getting and Cleaning Data Project
## Coursera, 2015

## Initiate library 'reshape2'. We will need this to apply 'dcast' later.
library(reshape2)

## Create dataframes containing the smartphone data for 'test' and 'train'
## participants. 
dataTest <- read.table("./test/X_test.txt")
dataTrain <- read.table("./train/X_train.txt")

## Create the dataframe 'variableNames' from "features.txt". Note that the 
## second column of the resulting dataframe contains the variable names of 
## 'dataTest' and 'dataTrain'. Extract this second column as a character vector
## also named 'variableNames'.
variableNames <- read.table("./features.txt")
variableNames <- variableNames$V2
variableNames <- as.character(variableNames)

## Use the vector 'variableNames' to change the variable names of 'dataTest' 
## and 'dataTrain'. We will improve these variable names later. 
names(dataTest) <- variableNames
names(dataTrain) <- variableNames

## Remove from 'dataTest' and 'dataTrain' all variables, except those whose name
## includes 'std()' or 'mean()'. Note that we must use '\\', since '(' and ')' 
## are both metacharacters in R and in regular expressions.
meanstdIndices <- union(grep("mean\\(\\)",variableNames),grep("std\\(\\)",variableNames))
meanstdIndices <- sort(meanstdIndices)
dataTest <- dataTest[,meanstdIndices]
dataTrain <- dataTrain[,meanstdIndices]

## The files 'subject_test.txt' and 'subject_train.txt' give the participant 
## identification number for each row of 'dataTest' and 'dataTrain'. We extract 
## a vector from these files and add the vector as a new variable 'participant'
## in 'dataTest' and 'dataTrain'.
participantTest <- read.table("./test/subject_test.txt")
dataTest$participant <- participantTest$V1
participantTrain <- read.table("./train/subject_train.txt")
dataTrain$participant <- participantTrain$V1

## The files 'Y_test.txt' and 'Y_train.txt' give the activity
## identification number for each row of 'dataTest' and 'dataTrain'. We extract 
## a vector from these files and add the vector as the new variable 'activity' 
## in 'dataTest' and 'dataTrain'.
activityTest <- read.table("./test/Y_test.txt")
dataTest$activity <- activityTest$V1
activityTrain <- read.table("./train/Y_train.txt")
dataTrain$activity <- activityTrain$V1

## Add the rows of 'dataTrain' to 'dataTest'. This can be done because both 
## dataset have identical variables. We must rename the rows of 'dataTest'
## and 'dataTrain' so that they do not share any common names. Otherwise,
## the 'rbind' function throws a 'duplicate row.names' error.
a <- nrow(dataTrain)
b <- nrow(dataTest)
row.names(dataTrain) <- 1:a
row.names(dataTest) <- (a+1):(a+b)
mergedData <- rbind(dataTrain,dataTest)

## Improve the readability of the variable names in 'mergedData' as follows: 
## 1. Removing all occurrences of "-", "(", and "(". 
## 2. Replace "Acc" with "Accelerometer"
## 3. Replace "Gyro" with "Gyroscopte"
## 4. Replace "mean" with "Mean"
## 5. Replace "std" with "StandardDeviation"
names(mergedData) <- gsub("-","",names(mergedData))
names(mergedData) <- gsub("\\(","",names(mergedData))
names(mergedData) <- gsub("\\)","",names(mergedData))
names(mergedData) <- gsub("Acc","Accelerometer",names(mergedData))
names(mergedData) <- gsub("Gyro","Gyroscope",names(mergedData))
names(mergedData) <- gsub("mean","Mean",names(mergedData))
names(mergedData) <- gsub("std","StandardDeviation",names(mergedData))

## Translate entries in 'activity' into one of the following:
## "walking", "walking upstairs", "walking downstairs", "sitting", "standing", 
## "laying".
mergedData$activity <- as.character(mergedData$activity)
i <- 1
for( i in seq_along(mergedData$activity)){
        if(mergedData$activity[i] == "1"){
                mergedData$activity[i] <- "walking"
        }
        else if(mergedData$activity[i] == "2"){
                mergedData$activity[i] <- "walking upstairs"
        }
        else if(mergedData$activity[i] == "3"){
                mergedData$activity[i] <- "walking downstairs"
        }
        else if(mergedData$activity[i] == "4"){
                mergedData$activity[i] <- "sitting"
        }
        else if(mergedData$activity[i] == "5"){
                mergedData$activity[i] <- "standing"
        }
        else{
                mergedData$activity[i] <- "laying"
        }
}

## Melt the dataframe 'mergedData' with id's 'participant' and 'activity' and with
## measure variables the remaining 66 variables of 'mergedData'. We melt the data
## so that we can apply 'dcast' and create a dataframe 'tidyAverages' containing
## the average value of each measure variable for every combination of 
## 'participant' and 'activity' values. 
meltData <- melt(mergedData,id=c("participant","activity"),measure.vars=names(mergedData)[1:66])
tidyAverages <- dcast(meltData, participant + activity ~ variable,mean)

## Write the 'avgData' dataframe to the file 'avgData.txt'. This creates a 
## space delimited text file, which includes a header of variable names and 
## one row for each row of 'avgData'. To read this data into R use the command:
## read.table("tidyAverages.txt",header=TRUE)
write.table(tidyAverages,file="tidyAverages.txt",row.names=FALSE)
