# AUTHOR: Thao-Nguyen Ho
# This script plots a bar graph of the annual HIV diagnoses across different
# race from the years 2011 to 2015

# Load packages
library("dplyr")
library("ggplot2")

# Load data
nyc_hiv_aids <- read.csv("https://query.data.world/s/rzk4fvws5jf6rnzvv5tuo2net7af5y?dws=00000",
                         header=TRUE,
                         stringsAsFactors=FALSE)

# Retrieve the different racial groups from the Race column
racial_groups <- nyc_hiv_aids %>%
  filter(Race != "All")

# Plot the data in a bar graph
chart <- ggplot(data = racial_groups) +
  geom_col(mapping = aes(
    x = Race,
    y = HIV.diagnoses,
    fill = "red"
  )) +
  labs(
    title = "HIV Diagnoses Across Different Race, 2011-2015",
    x = "Race",
    y = "HIV Diagnoses"
  )
