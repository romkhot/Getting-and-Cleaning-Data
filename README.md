Getting and Cleaning Data - Course Project
==========================================

This repository contains the R code, source and output data for the course project "Getting and Cleaning data" on Coursera, the Data Science specialization.

The dataset being used is the data collected from the accelerometers from the Samsung Galaxy S smartphone: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files

The code takes all the data from the UCI-HAR-Dataset folder, that downloaded from here: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

`CodeBook.md` describes the variables, the data, and modifications that was performed to clean up the data.

`run_analysis.R` contains the code to perform all 5 steps. Script can be launched in RStudio by just importing this file together with the UCI-HAR-Dataset folder.

The UCI-HAR-Dataset folder contains both source and output data.

The output of the script is the `avg_data.txt` text file. You can find it in the UCI-HAR-Dataset folder, also it was uploaded into the project's form.
