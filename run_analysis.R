##before running this script please install the dplyr package if 
##you don't already have it installed
## install.packages("dplyr")

analyze <- function(){

  train_labels <- read.table("./data_assignment/train/y_train.txt")
  
  training_set <-  read.table("./data_assignment/train/x_train.txt")
  
  test_set <- read.table("./data_assignment/test/x_test.txt")
  
  test_labels <- read.table("./data_assignment/test/y_test.txt")
  
  activity_labels <- read.table("./data_assignment/activity_labels.txt")
  
  subject_train_ids <- read.table("./data_assignment/train/subject_train.txt")
  
  subject_test_ids <- read.table("./data_assignment/test/subject_test.txt")
  
  features <- read.table("./data_assignment/features.txt") ##nombres de vars para los sets.
  
  test_labels1 <- merge(activity_labels, test_labels)
  train_labels1 <- merge(activity_labels, train_labels)
  
  ##remove columns with activity numbers (redundant)
  
  test_labels1[,1] <- NULL
  train_labels1[,1] <- NULL
  
  ##adding the subjects for each dataset
  complete_train <- cbind(training_set, subject_train_ids, train_labels1)
  
  complete_test <- cbind(test_set, subject_test_ids, test_labels1) 
  
  ##combining both (test and training) datasets
  
  merged <- rbind(complete_train, complete_test)
  
  ## changing the colnames so each has the name of the corresponding activity
  
  ##for (i in 1:length(features$V2)) {
  ##       colnames(merged)[i] <- as.character(features$V2[i])
  ##   }
  
  ##simplified version of for above, unique is set to TRUE so I don't get error duplicate name
  colnames(merged) = make.names(features$V2, unique=TRUE)
  
  ##change name of last columns
  
  colnames(merged)[562] = "Subject"
  
  colnames(merged)[563] = "Activity"
 
 merged
  
}

extractMeanSd <- function( ){
  
  data <- analyze()
  ##in case I don't want to include the last column
  ##remove_last <- ncol(data) - 1
  ##data <- analyzed()[,1:remove_last]
  
  ## double slash = one slash in r - regular expression to match only the mean 
  ## and not meanFreq, or gravityMean

 means <- select(data, matches("\\.mean\\.\\."))
 
 sd <- select(data, contains("std"))
 
 ##puts both means and sd in one data_frame
                 
 means_sd <- cbind(means, sd)
 
 means_sd

}

independent <- function(){
  data <- analyze()
  
  tidy <- ddply(data, c("Subject", "Activity") , function(x) colMeans(x[,1:561]) )
  
  write.table(tidy, file="tidy.txt", row.names=FALSE)
}
