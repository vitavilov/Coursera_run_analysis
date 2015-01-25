
# 1. Merging the dataset --------------------------------------------------

#reading data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#binding data
big_ds <- cbind(rbind(subject_test,subject_train),
                rbind(y_test,y_train),
                rbind(X_test, X_train)
                )

#remove unused objects
rm(subject_test,
   subject_train,
   X_test,
   X_train,
   y_test,
   y_train)


# Apply column name and activity type descriptive labels ------------------

#read files with lables
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                              stringsAsFactors = FALSE)

features <- read.table("./UCI HAR Dataset/features.txt", 
                       stringsAsFactors = FALSE)

#set column names
colnames(big_ds)[1:2] <- c("subject", "activity")
colnames(big_ds)[3:ncol(big_ds)] <- features[[2]]

#set activity lables
for (i in 1:nrow(activity_labels)){
        big_ds[big_ds$activity==i,2] <- activity_labels[i,2]
}

#remove unused objects
rm(i, activity_labels, features)


# Extracting mean and standadrd deviation for each measurement ------------

#find which columns do we need
col <- sort(c(grep("mean()", colnames(big_ds), fixed = T),
              grep("std()", colnames(big_ds), fixed = T)
              )
            )

#subset and rename
windows_mean_std <- big_ds[,c(1,2,col)]

#remove unused objects
rm(col, big_ds)


# creating tidy data set with the average of each variable ----------------

library(tidyr)
library(dplyr)

#make data tidy in long form
act_subj_lform <- as.tbl(windows_mean_std) %>%
        gather(feature, value, -activity, -subject) %>%
        group_by(activity,subject,feature) %>%
        summarise(var_avg = mean(value))

#make wide form of tidy data
act_subj_wform <- spread(data = act_subj_lform,
                          key = feature,
                          value = var_avg)

#write to text file
write.table(act_subj_wform, "act_subj_wform.txt", 
            sep = " ", row.names = F, col.names = T
            )
