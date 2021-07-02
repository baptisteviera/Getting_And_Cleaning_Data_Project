# Code Book

## Variables

1. SubjectTest: refers to subject number data (test)
2. Xtest : refers to X test data
3. Ytest : refers to Y test data
4. SubjectTrain : refers to subject number (train)
5. Xtrain : refers to X train data
6. Ytrain : refers to Y train data
7. MyDataTest : refers to the combination of SubjectTest, Xtest, Ytest
8. MyDataTrain :  refers to the combination of SubjectTrain, Xtrain, Ytrain
9. MyDataTestandTrain : refers to the combinaison of MyDataTest, MyDataTrain
10. Features : refers to Xtest, Xtrain
11. ColumnsNames : refers to the name of all columns
12. ColumnsOnlyMeansAndStd : refers to the numbers of the columns which contains either Subjet, Activity, M/mean or std in their names.
13. MyDataTestandTrain2 : refers to the values corresponding of this columns (ColumnsOnlyMeansAndStd) in the following data set (MyDataTestandTrain)
14. ActivityLabels : refers to different type of activities which are associated with number
15. MyDataTestandTrainTidy :  refers to a tidy data set (from MyDataTestandTrain2)  with the average of each variable for each activity and each subject.


## Transformations

### 1. Merges the training and the test sets to create one data set
* Read Test and Train data. Create Test data set (combination of columns) and Train data set (combination of columns). 
* Then, create a unique data set by combining Test and Train data set by columns.
 
 ### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 * Add into a variable called "ColumnsNames" the columns Subject, Activity and all the rows of the columns 2 of the table "Feature"
 * Among the variable ColumnsNames, only select the number of each columns which contains Subject, Activity, Mean or std.
 * By using the previous variable (ColumnsOnlyMeansAndStd), extract from the unique data set the columns and values needed. Name of the new variable : MyDataTestandTrain2
 
 ### 3. Uses descriptive activity names to name the activities in the data set
 * Transform the number which refers to a specific activity into a string that's to say into the activity name
 
 ### 4. Appropriately labels the data set with descriptive variable names
 * Rename the columns of MyDataTestandTrain2 by using ColumnsNames and ColumnsOnlyMeansAndStd variables
 * Replace acronyms / abrevations by full words
 
 ### 5. Creates a independent tidy data set with the average of each variable for each activity and each subject
 * From MyDataTestandTrain2 data set, grouped by subject, then by activity.
 * Then summarize each variable by focusing on mean
 * Finally, save the tidy data set in a txt file named MyDataTestandTrainTidy.txt
 
