# Load data into R and extract the csv file
library(readr)
read.csv(hw1_data.csv)
hw1_data <- read_csv("Course2_R_Programming/hw1_data.csv") 
print.data.frame(hw1_data) # read out of the whole data frame into the console

#Find missing values in the dataset and quantify the amount of NA values
missing_values <- sum(is.na(hw1_data$Ozone))

# Print the number of missing values
print(missing_values)

# identifying NA values and removing them
bad = is.na(hw1_data)
##Run this to see the print out of the data without NA values
#hw1_data[!bad] 
#Extract the mean of one of all the variables
colMeans(hw1_data)

#Individual variables:

#Find the mean of "Ozone":
# Check for missing values in the "Ozone" column
ozone_complete <- hw1_data$Ozone[complete.cases(hw1_data$Ozone)]
# Calculate the mean of non-missing values in the "Ozone" column
mean_ozone <- mean(ozone_complete)
# Print the mean
print(mean_ozone)

#Find the Max Ozone value in the month of May (5):
# Subset the data where "Month" equals 5 and select the "Ozone" column
ozone_month_5 <- hw1_data$Ozone[hw1_data$Month == 5]
# Find the maximum value in the subsetted "Ozone" column
max_ozone_month_5 <- max(ozone_month_5, na.rm = TRUE)
# Print the maximum value
print(max_ozone_month_5)

# Mean Temp when Month is equal to 6:
# Subset the data where "Month" equals 5 and select the "Temp" column
temp_month_6 <- hw1_data$Temp[hw1_data$Month == 6]
# Find the mean value in the subsetted "Temp" column
mean_temp_month_6 <- mean(temp_month_6)
#Print calculated mean value
print(mean_temp_month_6)

#Extract the subset of rows of the data frame where Ozone values are above 31 
#and Temp values are above 90. What is the mean of Solar.R in this subset?
# Subset the data where "Ozone" is above 31 and "Temp" is above 90.
ozone_above_31_temp_above_90 = hw1_data[hw1_data$Ozone > 31 & hw1_data$Temp > 90]
#Find the mean value of "Solar.R" in subsetted data
solar_r_mean = mean(ozone_above_31_temp_above_90$Solar.R, na.rm = TRUE)
#Print value
print(solar_r_mean)


