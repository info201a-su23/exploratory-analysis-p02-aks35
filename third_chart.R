# AUTHOR: Akshata Aravind
# This script plots a line graph of the annual HIV and AIDS
# related death rate in New York from the years 2011 to 2015

library(tidyverse)
library (dplyr)

# Read csv HIV data file
hiv_data <- read.csv("https://query.data.world/s/xczx3uckptufkmufrve6salo6x5sim?dws=00000")

# Retrieve the HIV related death rate per year in New York
annual_death_rates <- hiv_data %>%
  filter(
    Borough == "All",
    UHF == "All",
    Gender == "All",
    Age == "All",
    Race == "All"
    ) %>%
  select(Year, Death.rate)

# Plotting the data in a line graph
ggplot(data = annual_death_rates, aes(x = Year, y = Death.rate, group = 1)) +
  geom_line(color = "blue") +
  geom_point() +
  labs(
    title = "HIV and AIDS Related Death Rate 2011-2015",
    x = "Year",
    y = "HIV and AIDS Related Death Rate"
  )