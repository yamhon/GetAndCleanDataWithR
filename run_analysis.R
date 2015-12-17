setwd("D:/GetAndCleanDataWithR/UCI HAR Dataset")

rm(list = ls()) # clear environment

library(data.table) #function: tbl_df(), melt()
library(tidyr)
library(dplyr)

# step 1a: read and merge data
readData <- function(datafile, ...) {
  message("Reading data: ", datafile, appendLF = T)
  f1 <- sub("%", datafile, "train/%_train.txt")
  f2 <- sub("%", datafile, "test/%_test.txt")
  if (!file.exists(f1)) { stop("File '", f1, "' not found") }
  if (!file.exists(f2)) { stop("File '", f2, "' not found") }
  return ( rbind( read.table(f1, ...), read.table(f2, ...) ) )
}

features <- read.table("features.txt")

# step 1
message("Step 1: Merging data ...", appendLF = T)
subject  <- readData("subject", col.names = c("subject"))
y        <- readData("Y", col.names = c("y"))
x        <- readData("X", col.names = features[,2])
combined <- cbind(subject, y, x)

# step 2
# feature name translated from 'tBodyAcc-mean()-X' to 'tBodyAcc.mean...X'
# retains 'mean', 'std' only (ignoring 'meanFreq')
message("Step 2: Selecting features: mean/std of original measures", appendLF = T)
colIndex <- grep("\\.mean\\.|\\.std\\.", colnames(combined))
selected <- combined[, c(1,2,colIndex)]
message(length(colIndex), " feature(s) selected", appendLF = T)

# step 3
message("Step 3: Labelling activity", appendLF = T)
labelled <- selected %>%
  inner_join( read.table("activity_labels.txt", 
                         col.names = c("y", "activity") )
              ) %>%
  select(-y) #discard original y column

# step 4b
message("Step 4: Tidying data", appendLF = T)
melten <- melt(labelled, id = c("subject", "activity"))

# step 5: creates a second, independent tidy data set with the average of each
# variable for each activity and each subject
message("Step 5a: Averaging measures", appendLF = T)
colIndex <- colIndex - 2 # skipping first 2 columns (subject, y)
casted <- dcast(melten, 
                subject + activity ~ features[colIndex, 2], 
                mean)

message("Step 5b: Tidying data", appendLF = T)
ans <- casted %>% 
  melt(id = c("subject", "activity"), 
       variable.name = "feature", 
       value.name = "average") %>%
  separate(feature, c("domain","feature"), 1, remove = TRUE) %>%
  mutate(domain = as.factor(ifelse(domain=="f","Frequencey","Time")))

message("Writing file", appendLF = T)
write.table(ans, file = "step5_ans.txt", row.name = FALSE)

message("End-of-script", appendLF = T)
