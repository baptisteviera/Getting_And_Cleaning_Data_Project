
# I suppose I've already downloaded the different data sets in my computer

# 1) Put data in different variables

# Data refered to test
SubjectTest <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
Xtest <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

# Data refered to train
SubjectTrain <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
Xtrain <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")

# 2) Merge test and train data sets

# Merge subject, x, y for test and train data sets
MyDataTest  <- cbind(SubjectTest, Ytest, Xtest)
MyDataTrain <- cbind(SubjectTrain, Ytrain, Xtrain)

# My unique data set
MyDataTestandTrain <- rbind(MyDataTest, MyDataTrain)

# 2) Extracts only the measurements on the mean and standard deviation for each measurement.

# Put features data set in a variable
Features <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

# Convert column 2 into character
Features[,2]<-as.character(Features[,2])

# Add into a variable called "ColumnsNames" the columns Subject, Activity and all the rows of the columns 2 of the table "Feature"
ColumnsNames <- c("Subject", "Activity",Features[,2])

#Among the variable ColumnsNames we only select the number of each columns which contains Subject|Activity|[mM]ean|st
ColumnsOnlyMeansAndStd <- grep("Subject|Activity|[mM]ean|std", ColumnsNames, value = FALSE)

# This new table contains only the columns needed from the MyDataTestandTrain table
MyDataTestandTrain2 <- MyDataTestandTrain[ ,ColumnsOnlyMeansAndStd]

# 3) Uses descriptive activity names to name the activities in the data set

ActivityLabels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
ActivityLabels[,2]<-as.character(ActivityLabels[,2])

# Rename columns
colnames(ActivityLabels) <- c("Num", "Type")

# Transform the number which refers to a specific activity into a string
MyDataTestandTrain2[,2] <- ActivityLabels$Type[MyDataTestandTrain2[,2]]

# Rename columns names
names(MyDataTestandTrain2) <- ColumnsNames[ColumnsOnlyMeansAndStd]

# 4) Appropriately labels the data set with descriptive variable names.
#replace acronyms by full words
names(MyDataTestandTrain2) <- gsub("^t", "time", names(MyDataTestandTrain2))
names(MyDataTestandTrain2) <- gsub("Acc", "Accelerometer", names(MyDataTestandTrain2))
names(MyDataTestandTrain2) <- gsub("Gyro", "Gyroscope", names(MyDataTestandTrain2))
names(MyDataTestandTrain2) <- gsub("Mag", "Magnitude", names(MyDataTestandTrain2))
names(MyDataTestandTrain2) <- gsub("^f", "frequency", names(MyDataTestandTrain2))

# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
MyDataTestandTrainTidy <- MyDataTestandTrain2 %>% group_by(Activity, Subject) %>% summarise_all(mean)

write.table(MyDataTestandTrainTidy, file = "MyDataTestandTrainTidy.txt", row.names = FALSE, quote = FALSE)
