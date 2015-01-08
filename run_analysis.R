run_analysis <- function(){
  
      ## Building train and test datasets
      
      features <- read.table("features.txt")
      testSubject <- read.table("test/subject_test.txt")
      testRecord <- read.table("test/X_test.txt")
      testLabel <- read.table("test/y_test.txt")
      
      
           colnames(testSubject) <- "Subject"
           colnames(testRecord) <- features[,2]
           colnames(testLabel) <- "Activity"
                          testdata <- cbind(testSubject,testLabel,testRecord)
      
      trainSubject <- read.table("train/subject_train.txt")
      trainRecord <- read.table("train/X_train.txt")
      trainLabel <- read.table("train/y_train.txt")
            
           colnames(trainSubject) <- "Subject"
           colnames(trainRecord) <- features[,2]
           colnames(trainLabel) <- "Activity"
                           traindata <- cbind(trainSubject,trainLabel,trainRecord)
      
      
      ##Merging train and test datasets
      
                   totaldata <- rbind(testdata,traindata)
      
      ## Extracting only mean and standard deviation measurements
      
                   requiredfeatures <- grep("mean|std",colnames(totaldata))
                   finalfeatures <- append(c(1,2),requiredfeatures)
                   
                            finaldata <- totaldata[,finalfeatures]
      
      ## Replace descriptive activity names
      
      
          activity <- read.table("activity_labels.txt")
          index <- activity[,1]
          activitylabels <- as.character(activity[,2])
                
                  for(i in index){
                   finaldata$Activity[finaldata$Activity == i] <- activitylabels[i]
                  }
      
       ## Creating a dataset with average values for each subject and activity
      
      library(reshape2)
      variablefeatures <- colnames(totaldata[requiredfeatures])
      datamelt <- melt(finaldata,id.vars=c("Subject","Activity"),measure.vars=variablefeatures)
      tidydata <- dcast(datamelt, Subject + Activity ~ variable,mean)
      write.table(tidydata,"tidydata.txt",row.names=FALSE)
      
}