---
title: "Codebook"
author: "Guergana Tzatchkova"
date: "March 18, 2015"
---

## Project Description
This is a course project file for Getting and Cleaning Data

##Study design and data processing

###Collection of the raw data
The raw data was taken from this address: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

for further info refer to the Readme.txt file inside of the datafiles.

##Creating the tidy datafile

###Guide to create the tidy data file
To create the tidy.txt file just 

1. run the r file: source("run_analysis.R")
2) run the function independent()

##Description of the variables in the tidy.txt file
The tidy.txt file: 
 * has a dimension of 40 obs. x 563 variables
 * Summary of the data
  + $ Subject                             : int  1 2 3 4 4 5 6 6 7 8 ...
 + $ Activity                            : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 6 4 4 6 6 6 ...
 + $ tBodyAcc.mean...X                   : num  0.266 0.273 0.273 0.277 0.27 ...
 + $ tBodyAcc.mean...Y                   : num  -0.0183 -0.0191 -0.0179 -0.0133 -0.0171 ...
 + $ tBodyAcc.mean...Z                   : num  -0.108 -0.116 -0.106 -0.106 -0.11 ...
 + $ tBodyAcc.std...X                    : num  -0.546 -0.606 -0.623 -0.684 -0.481 ...
 + $ tBodyAcc.std...Y                    : num  -0.368 -0.429 -0.48 -0.59 -0.384 ...
 + $ tBodyAcc.std...Z                    : num  -0.503 -0.589 -0.654 -0.742 -0.658 ...
 + $ tBodyAcc.mad...X                    : num  -0.58 -0.64 -0.654 -0.711 -0.516 ...
 + $ tBodyAcc.mad...Y                    : num  -0.391 -0.445 -0.489 -0.601 -0.407 ...
 * The variables are the ones included in the original data with (2) Subject and Activity columns added.
