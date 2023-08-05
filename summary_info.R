summary_info <- function() {
  # Load necessary packages
  library(dplyr)
  # Load the data
  df <- read.csv("https://query.data.world/s/fglt3xstp3jmdafif64rlbqk223zyj?dws=00000", header=TRUE, stringsAsFactors=FALSE)
  # A list to store the summary information
  summary_info <- list()
  
  # Calculate the mean number of HIV diagnoses
  summary_info$mean_HIV_diagnoses <- mean(df$HIV.diagnoses, na.rm = TRUE)
  # Calculate the mean HIV diagnosis rate
  summary_info$mean_HIV_diagnosis_rate <- mean(df$HIV.diagnosis.rate, na.rm = TRUE)
  
  # Calculate the total number of deaths
  summary_info$total_deaths <- sum(df$Deaths, na.rm = TRUE)
  
  # Calculate the total number of females affected by HIV 
  df_females <- df[df$Gender == 'Female', ]
  summary_info$total_females_affected_HIV <- sum(df_females$HIV.diagnoses, na.rm= TRUE)
  
  # Calculate the total number of males affected by HIV 
  df_males <- df[df$Gender == 'Male', ]
  summary_info$total_males_affected_HIV <- sum(df_males$HIV.diagnoses, na.rm= TRUE)
  
  return(summary_info)
}
