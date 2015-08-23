# Getting-and-Cleaning-Data-Project

Code proceeds as follows.

Step 1: Load 'features.txt' file and extract feature names containing either 'mean' or 'std'.

Step 2: Load train and test sets. These are 'X_train.txt', 'X_test.txt', 'Y_train.txt', 'Y_test.txt'.
Extract only columns which are identified in Step 1. Then, combine train and test sets by 'rbind' command. 
Name columns of 'X' data according to the feature names from Step 1. Name 'Y' vector as "ActivityId".

Step 3: Load 'subject' data. Combine train and test sets. Then combine 'X', 'Y' and 'Subject' data.

Step 4: Load 'activity labels' data. Name the numeric column in the data as "ActivityId".
Merge 'activity labels' data into the main data from Step 3 by variable "ActivityId".

Step 5: Compute averages of variables for each activity and subject using 'aggregate' command. Write the table into a text file.

