---
title: "Cook Book for the Course Project"
output: html_document
---

This is the cook book for the Course Project of the Getting and Cleaning Data MOOC.

Variables

`activities` retrieved from `./activity_labels.txt` consists of activity code and activity labels:

Code |Activity
 --- |---
1|	WALKING
2|	WALKING_UPSTAIRS
3|	WALKING_DOWNSTAIRS
4|	SITTING
5|	STANDING
6|	LAYING

`features` includes all measurement features retrieved from `./features.txt`

`measurement.filtered` only includes measurement features relating to mean and standard deviation.

`merged.data` is merge by row from `test.x` and `train.x`

'merged.subject` is merge by row from `test.subject` and `train.subject`

`mergedDB` is the merge by column from subject, descriptive activity labels and filtered merged data

`mergedDB` data is melted by using `melt` function from `reshape2` to melt all measurements at each `Subject` and `Activity` variable, using this code:

```{r}
testmelt <- melt(mergedDB, id.vars = c("Subject", "Activity"))
```

`tidyData` is the required tidy data which list the average of each filtered feature measurement per subject and activity, using the following code:
  
You can also embed plots, for example:

```
tidyData <- dcast(testmelt, Subject + Activity ~ variable, fun.aggregate = mean)
```