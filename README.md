================================================
				  Coursera
Course Project for Getting and Cleaning Data
================================================
## A. Required tasks:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

## B. Script task explanation:
a. Read activity labels (./activity_labels.txt) to create the activity data table consisting of activity Code (1-6) and equivalent activity labels
b. Read all 561 measurement features from (./features.txt)
c. Record the index of measurement features which are only relating to the mean or standard deviation values.
d. Use the index vector record to extract only 66 "mean/stdev"-type measurement features
e. Modify the descriptions of column names of measurement features (e.g. tBodyAcc-mean()-X become Time.BodyAcc.Mean.X)
f. Merge two data sets including x_test (./test/x_test.txt) and x_train (./train/X_train.txt) in to a big data set with 561 measurement features
i. Using the record of "mean/stdev"-type measurement features to filter the merged data
j. Merge test subject data (./test/subject_test.txt) and train subject data (./train/subject_train.txt)
k. Merge test activity data (./test/y_test.txt) and activity data(/train/Y_train.txt)
l. Substitute the activity codes with the relevant descriptive activity labels 
m. Merge all three data sets: merged subject data, merged activity label data and filtered merged data.
n. Create tidy data set by data reshape, listing the average of 66 "mean/stdev"-type measurement data for each activity and subject
o. Write down the tidy data to the hard disk