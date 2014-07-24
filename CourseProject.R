########## Course Project #########
path <- "F:/UHM/Coursera/Data Science/3_Getting and Cleaning Data/Course Project/UCI HAR Dataset/"
setwd(path)

# read activities
activities <- read.csv(file = "./activity_labels.txt", header = FALSE, sep=" ", col.names=c("Code", "Activity"))

# reading all features
features <- read.csv(file = "./features.txt", header = FALSE, sep = "", col.names=c("No", "Measurement.Type"))

# record the index of the features which is only relating to the mean and stdev values.
mean.type <- grep("\\-mean\\()", features$Measurement.Type)
std.type <- grep("\\-std\\()", features$Measurement.Type)
type <- append(mean.type, std.type)

# create measurement variable from filtered features
measurement <- features[type,]

# modify the measurement descriptions
measurement.filtered <- NULL
for (i in measurement$Measurement.Type){
        i <- sub("\\-mean\\()", ".Mean", i)
        i <- sub("\\-std\\()", ".Stdev", i)
        i <- sub("-X", ".X", i)
        i <- sub("-Y", ".Y", i)
        i <- sub("-Z", ".Z", i)
        i <- sub("tBody", "Time.Body", i)
        i <- sub("fBody", "Freq.Body", i)
        i <- sub("tGravity", "Time.Gravity", i)
        i <- sub("fGravity", "Freq.Gravity", i)
        measurement.filtered <- append(measurement.filtered, i)
}
measurement$Measurement.Type <- measurement.filtered

# read test data 
test.subject <- read.csv(file = "./test/subject_test.txt", header = FALSE, sep = "", col.names = "Subject")
test.x <- read.csv(file = "./test/x_test.txt", header = FALSE, sep = "")
test.y <- read.csv(file = "./test/y_test.txt", header = FALSE, sep = "", col.names = "Label")

# read train data
train.subject <- read.csv(file = "./train/subject_train.txt", header = FALSE, sep="", col.names = "Subject")
train.x <- read.csv(file = "./train/X_train.txt", header = FALSE, sep = "")
train.y <- read.csv(file = "./train/y_train.txt", header = FALSE, sep = "", col.names = "Label")

# merge two data sets test.x and train.x and filter columns with measurement
merged.data <- rbind(test.x, train.x)  # merge data by combining rows
filtered.merged.data <- merged.data[,measurement$No]  # filter merged data
names(filtered.merged.data) <- measurement$Measurement.Type   # substitute new descriptive headings

merged.subject <- rbind(test.subject, train.subject) # merge subjects from test and train data
merged.activity <- rbind(test.y, train.y) # merge activities from test and train data

act <- merge(merged.activity, activities, by.x = "Label", by.y = "Code") # substitute to descriptive activity data

mergedDB <- cbind(merged.subject, act[2], filtered.merged.data) # merged data with subject, descriptive actiitity and selected measurement

# create tidy data set by dat reshape
library(reshape2)
testmelt <- melt(mergedDB, id.vars = c("Subject", "Activity"))
tidyData <- dcast(testmelt, Subject + Activity ~ variable, fun.aggregate = mean)

#  write down the tidy data to disk
write.csv(tidyData, file = "tidydata.csv")