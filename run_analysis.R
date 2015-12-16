setwd("D:/GetAndCleanDataWithR/UCI HAR Dataset")

rm(list = ls()) # clear environment

# step 1a: read and merge data
readData <- function(datafile, ...) {
  message ("Reading data: ", datafile, appendLF = T)
  f1 <- sub("%", datafile, "train/%_train.txt")
  f2 <- sub("%", datafile, "test/%_test.txt")
  if (!file.exists(f1)) { stop("File '", f1, "' not found") }
  if (!file.exists(f2)) { stop("File '", f2, "' not found") }
  return( rbind( read.table(f1, ...), 
                 read.table(f2, ...)
                 )
          )
}

# step 1
features <- read.table("features.txt", col.names = c("col_id", "name"))
subject  <- readData("subject", col.names = c("subject"))
y        <- readData("Y", col.names = c("y"))
x        <- readData("X", col.names = features$name)
combined <- cbind(subject, y, x)

# step 2
# feature name translate from 'tBodyAcc-mean()-X' to 'tBodyAcc.mean...X'
message ("Selecting features: mean/std of original measures", appendLF = T)
colIndex <- grep("\\.mean\\.|\\.std\\.", colnames(combined))
selected <- combined[, c(1,2,colIndex)]
message (length(colIndex), " feature(s) selected", appendLF = T)

# step 3
message ("Labelling activity", appendLF = T)
labelled <- merge(selected, 
                  read.table("activity_labels.txt", 
                             col.names = c("y", "activity"))
                  )

#library(plyr)
library(data.table)
library(tidyr)
library(dplyr)

# step 4b
keyList <- c("subject", "y", "activity")
message("Tidying data", appendLF = T)
melten <- melt(labelled, id = keyList)

# step 5: creates a second, independent tidy data set with the average of each
# variable for each activity and each subject
message ("Averaging measures", appendLF = T)
colIndex <- colIndex - 2
ans <- dcast(melten, 
             subject + y + activity ~ features[colIndex, 2], 
             mean)

message ("Renaming columns", appendLF = T)
colNames <- names(ans)[4:length(names(ans))]
names(ans) <- c( keyList, paste0("AVG-", colNames) )
ans <- melt(ans, id = keyList)

message ("Writing file", appendLF = T)
write.table(ans, file = "step5_ans.txt", row.name = FALSE)

message ("End-of-script", appendLF = T)
