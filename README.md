# Getting-Cleaning-Data_assignment
Week 4, final assignment
Readme: 

To replicate my cleaning activity using my R script, called G&Cdata_course_project.R, users will need the following files saved in their working directory:
X_train.txt
subject_train.txt
y_train.txt
X_test.txt
subject_test.txt
y_test.txt
activity_labels.txt
features.txt

Once running the assignment script, the user will have a new object, new.data.txt in the same working directory location.

Use the following command to read in this new tidy data set:
new.data<-read.table(file_path/new.data.txt, header=TRUE)

Cleaning the data: 
The script provided, run_analysis.R will perform the cleaning actions on the above data files, 
as defined in the course project instructions. The code completes the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average 
   of each variable for each activity and each subject.

In the R script provided, the following commands take place: 
Users read in the activity_labels and features data objects.
Users also read in the X_train data set and add descriptive column names, and then add subject 
  and activity columns to the train object, updating the descriptive column names.
Users read in the X_test data set and add descriptive column names, and then add subject 
  and activity columns to the test object, updating the descriptive column names.
Next, users combine the train and test data objects. 
Users reduce the data object to just those columns containing the "mean()" or "std()" information.
Next, the activity codes are updated to a more descriptive text. 
Finally, a new object is created, which shows the average of each variable, by subject and 
  by activity
