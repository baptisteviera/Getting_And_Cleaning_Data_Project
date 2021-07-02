# MyGettingAndCleaningDataProject

## run_analysis.R (script)
The main goal of this script is to read all the data sets, then combine all of them into only one data set and finally clean this unique data set. To do taht, we reduced the data set by selecting only columns that contain means and standard deviations in their names. Additionally, we replaced number values by string values which is much more explicit. Finally, we replaced the acronyms by full names which is much more understandable.

## MyDataTestandTrainTidy.txt (output)
At the end of the script we create an independent tidy data set with the average of each variable for each activity and each subject. This data set is "saved" in a txt file named MyDataTestandTrainTidy.txt.

## CodeBook.md
This file describes the variables, the data, the transformations I've performed in my script named run_analysis.R in order to clean up the data.
