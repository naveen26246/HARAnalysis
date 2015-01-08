Analysis of Human Activity Recoginition Data
============================================


  This is a guide describing the **run_Analysis.R** script and the variables used. This script works on the Human Activity Recogniition data collected from the accelerometers from the Samsung Galaxy S smartphone whcih can be downloaded from [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  
### Breakdown of the run_Analysis script:
  1. The run_Analysis.R script should be copied to the working directory containing the unzipped raw data.
  2. The working directory has features.txt listing all the *561* variables for which data is collected and activity_labels.txt identifying the *6* activities for each label.
  3. The data is split in two folders test and train which contain three text files corresponding to the Subjects, Activity Labels and Records of all the features.
  4. The column names of these text files are changed descreptively.
  5. Two corresponding dataframes **testdata** and **traindata** are built by using cbind function on these textfiles.
  6. These two datasets are merged into **totaldata** using rbind since they have identical column names.
  7. A new dataset *finaldata* is extracted by subsetting the *totaldata* with features measuring either mean() or std() features.
  8. The numbers in the **Activity** column in **finaldata** are replaced by the corresponding descriptive names mentioned in the activity_labels.txt in the working directory.
  9. The script uses library(reshape2) for further analysis.
  10. The **finaldata** is reshaped my using melt() function with "Subject" and "Activity" as ID variables and the rest as measuring variables.
  11. A tidy dataset is then created which gives the mean of each measuring variable for every subject performing each activity using dcast() function.
  12. The script finally creates a writes this data into new textfile **tidydata** within the working directory.
