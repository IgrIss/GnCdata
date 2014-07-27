Getting and Cleaning Data: Course Project
=========================================

Introduction
------------
This is the course project for the Coursera's "Getting and Cleaning data", part of the Data Science specialization.

Regarding the raw data
------------------

The features are unlabeled and can be found in the x_test.txt and x_train.txt. 
The activity labels are in the y_test.txt and y_train.txt.
The test subjects are in the subject_test.txt and subject_train.txt.

Regarding the script and the tidy dataset
-------------------------------------
run_analysis.R would merge the test and training sets together.
Assumptions for this script:
1. the UCI HAR Dataset must be extracted and be availble in a directory called "UCI HAR Dataset"

After merging testing and training, labels are added and only columns containing means and standard deviations are filtered.

Finally, the script creates a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.
