## Getting and Clearing data Course project

based on "Human Activity Recognition Using Smartphones Data set Version 1.0"
The data and data set description available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Course project instructions web page - [here](https://class.coursera.org/getdata-010/human_grading/view/courses/973497/assessments/3/submissions)


### The submission includes the following files:
* README.md
* CodeBook.md - contains description of variables in act_subj_wform.txt
* run_analysis.R - R script that reproduces "act_subj_wform.txt" from initial dataset
* act_subj_wform.txt - the dataset submitted

### Dataset description
In accordance to course project instructions, each row of dataset represens a set of means and standard deviations of time and frequency domain variables from original dataset, averaged (over time period) for each subject and each activity type. For detailed description of 'features' read the [original dataset description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones))


You can read the dataset from R working directory using the code
```r
act_subj_wform <- read.table("act_subj_wform.txt", header=TRUE, quote="\"")
```

### Workflow process:

#### Brief instructions:
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for
each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data 
set with the average of each variable for each activity and each subject.

#### Completion steps:

**note 1:** "Internal Signals" data not involved since we don't need it to complete
the instructions

**note 2:** Completion steps are not exactly in order of the instructions.

1. Merging the data set
    + read all the tables
    + bind by rows `X`, `y` and `sublect` tables from `test` and `train` sub folders
    + bind by columns previously joined `subject`, `y`, and `X` data frames
    and call this new object `big_ds`
    + remove unused residual objects 
    
2. Applying column name and activity type descriptive labels
    + Read labels and activities description `activity_lables` and `features` 
    + set names for first two columns as "subject" and "activity"
    + apply `features` to set a column [3:563] names
    + use `big_ds` sub setting for introduce descriptive activity labels
    
3. Extracting mean and standard deviation for each measurement
    + According to variable description in `features_info.txt`, create a numeric 
    vector `col` that consists of column numbers, which names contains "mean()" or "std()" 
    + subset `big_ds` using `col` for columns, name a new data frame `windows_mean_std`
    
4. creating tidy data set with the average of each variable for each activity and each subject 
    + Attach {dplyr} and {tydyr} packages
    + make a long form of data using "gather", "group_by" and "summarize" functions
    + make more readable wide form using "spread" function
    + write the tidy data set in wide form to a `act_subj_wform.txt` space-separated file
 

        

        


