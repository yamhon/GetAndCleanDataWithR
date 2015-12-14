setwd("D:/UCI HAR Dataset")

rm(list = ls()) # clear environment

library(plyr)
library(dplyr)
library(data.table)

# step 1: read and merge data
readData <- function(f, col.names) {
  message ("Reading data ", f, appendLF = T)
  train <- read.table(sub("%", f, "train/%_train.txt"), col.names = col.names)
  test  <- read.table(sub("%", f, "test/%_test.txt")  , col.names = col.names)
  return(rbind(train, test))
}

# step 1, 4
features <- read.table("features.txt", col.names = c("col_id", "name"))
subject  <- readData("subject", c("subject"))
y        <- readData("Y", c("y"))
x        <- readData("X", features$name)

# step 3
message ("Labelling activity", appendLF = T)
y_labelled <- join(y, 
                   read.table("activity_labels.txt", 
                              col.names = c("y", "activity"))
                   )

# step 2
message ("Selecting features", appendLF = T)
colIndex <- grep("mean\\(\\)|std\\(\\)", features$name)
x_selected <- x[, colIndex]

# step 5: creates a second, independent tidy data set with the average of each
# variable for each activity and each subject
message ("Analysing data", appendLF = T)
ans <- dcast(melt(cbind(subject, y_labelled, x_selected),
                  id = c("subject", "y", "activity")
                  ), 
             subject + y + activity ~ features[colIndex, 2], 
             mean)

message ("Writing file", appendLF = T)
write.table(ans, file = "step5_ans.txt", row.name = FALSE)

message ("End-of-script", appendLF = T)
