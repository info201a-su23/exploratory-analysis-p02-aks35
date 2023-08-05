# AUTHOR: Michelle Ndugulile
# This script plots a box chart visualization of HIV diagnoses 
# by gender in New York from 2011 to 2015.

# Load packages
library(dbplyr)
library(ggplot2)

# Retrieve HIV/AIDS csv data file
df <- read.csv("https://query.data.world/s/phe5vpwsnbsigqddt5ydcylbim5om6?dws=00000", 
               header=TRUE, stringsAsFactors=FALSE)

# Plot data onto bar chart with filtered gender category "ALL" 
# from data frame to exclude repeats
ggplot(
  filter(df, Gender != "All"),
  aes(x = Gender, y = HIV.diagnoses, fill = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
      title = "Bar Chart of HIV Diagnosis by Gender from 2011 to 2015",
       x = "Gender",
       y = "HIV Diagnoses")
 


