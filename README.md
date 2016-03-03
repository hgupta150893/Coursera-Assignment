# Coursera-Assignment
Getting and Cleaning Data Programming Assignment

Steps followed for analysis:

1) Activity labels are read from the root directory and converted from factor into character format.
2) Features are read and converted into character in the same manner.
3) We need features that only consist of Mean and Standard Deviation from the data, so we use regular expressions to filter out the name of required columns from 'Features' data set. We store this result into a new data set called 'featuresWanted'
4) Names of the columns are extracted into data set called 'featuresWanted.names'
5) Names of the columns are corrected to remove parenthesis and '-' & case correction
6) Train and Test data sets are read with the required columns only (featuresWanted)
7) Activities and Subjects for both Train and Test data sets are read and column binded respectively
8) Final data set is created by appending Train and Test data sets and proper column names are given
9) Activity and Subject column of final data set are converted into factor for melt and cast operations
10) finalmelt is the data set which is melt by id variables 'subject' and 'Activity'
11) finalmean is data set after casting on 'variable' and using mean function
12) Data set is written to disk