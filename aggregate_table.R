# Load necessary packages
library(dplyr)
library(knitr)

# Load the data
df <- read.csv("https://query.data.world/s/fglt3xstp3jmdafif64rlbqk223zyj?dws=00000", header=TRUE, stringsAsFactors=FALSE)

# Aggregate data by 'Borough'
df_aggregate <- df %>%
  group_by(Borough) %>%
  summarise(Total_HIV_Diagnoses = sum(HIV.diagnoses, na.rm = TRUE),
            Total_Deaths = sum(Deaths, na.rm = TRUE),
            Females_Affected_HIV = sum(HIV.diagnoses[Gender == 'Female'], na.rm= TRUE),
            Males_Affected_HIV = sum(HIV.diagnoses[Gender == 'Male'], na.rm= TRUE))

# Save the table as an RDS file
saveRDS(df_aggregate, "df_aggregate.RDS")
