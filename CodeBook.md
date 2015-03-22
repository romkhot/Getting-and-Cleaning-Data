# Introduction

The script `run_analysis.R` performs the 5 steps described in the course project.

* All similar data (test + train files) are reading and then merging using the `rbind()` function. We assumes those files have the same number of columns.
* They have the list of names, stored in the `features.txt` file.
* Using regexp, we select from the `features`only the measurements with mean or std in their names.
* We take the activity names from `activity_labels.txt`.
* We correct column names in `y_` with the names from `act_labeles`.
* Finally, using the `aggregate` function, we generate a new dataset with the means for each activity-subject pair. The output file is `avg_data.txt`, it was uploaded to this repository, see the UCI-HAR-Dataset folder.

# Variables

* `x_`, `y_`,  `subj_` contain merged data from the source files.
* `features` contains the the list of all measurements.
* `mean_std_list` stores the measurements with mean or std in their names.
* `act_labeles` stores descriptive activity names to name the activities in the data set.
* `all_` merges `x_`, `y_` and `subj_` in a single large dataset.
* `avg_` contains the averages which will be stored in the `avg_data.txt` file. 
