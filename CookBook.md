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

`merged.data` is merge-by-row data from `test.x` and `train.x`

`merged.subject` is merge-by-row data from `test.subject` and `train.subject`

`mergedDB` is the merge-by-column data from subject, descriptive activity labels and filtered merged data

`mergedDB` data is melted by using `melt` function from `reshape2` to melt all measurements at each `Subject` and `Activity` variable, using this code:

```{r}
testmelt <- melt(mergedDB, id.vars = c("Subject", "Activity"))
```

`tidyData` is the required tidy data which list the average of each filtered feature measurement per subject and activity, using the following code:
  
You can also embed plots, for example:

```
tidyData <- dcast(testmelt, Subject + Activity ~ variable, fun.aggregate = mean)
```

tidyData will be shown like this:

Subject| Activity Time.BodyAcc.Mean.X| Time.BodyAcc.Mean.Y| Time.BodyAcc.Mean.Z| Time.GravityAcc.Mean.X| Time.GravityAcc.Mean.Y
--- |--- |--- |--- |--- | --- | ---
1 |WALKING_DOWNSTAIRS |0.2721542|-0.01532645 |-0.09497115 |0.9058006 |-0.33002665
1|WALKING_UPSTAIRS|0.2651301|-0.01855901|-0.10897579|0.7307416|-0.06083472
2|WALKING|0.2731131|-0.01913232|-0.11564996|0.6607829|-0.14721989
3| WALKING_DOWNSTAIRS|0.2734287|-0.01785607|-0.10649263|0.7078144|-0.02605905
4|WALKING|0.2741831|-0.01480815|-0.10752143|0.7065930|0.11259120
5| WALKING_DOWNSTAIRS|0.2791780|-0.01548335|-0.10566174|0.6981537|0.11231311