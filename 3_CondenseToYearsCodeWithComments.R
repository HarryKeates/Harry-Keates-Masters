## The following code was used to calculate the average number of captures for species per year and the total number of captures for species per year
## The first half of the code (seperated by the line labeled #-------#) calculated the mean values while the second half calculates the sum
## The mean value dataset accounted for the differences in seasons where captures took place and the number of captures per year
## This was achieved by grouping the data by Year, Site, and Season and summarizing any duplicate sets values by calculating the mean
## The following code is explained

## The packages dplyr and tidyr were necessary to provide the functions for the system

library(dplyr)
library(tidyr)

## Here is the input dataset

original_data <- read.csv("C:/Users/harry/Documents/MastersDataAnalysis/Current/SiteOneDuplicatedRemoved.csv")

## This first grouping grouped year, site and season
## The summarise then calculates the mean for grouped values such that if in 1978 at site 1 there was two capture events in Autumn the mean would be calculated for each species' captures
## This was done to increase consistency in the data frame by reducing bias to sites which had more data for particular seasons

grouped_data <- original_data %>%
  group_by(Year, Site, Season) %>%
  summarise(across(.cols = everything(), .fns = ~mean(., na.rm = TRUE), .names = "{col}"), .groups = "drop") %>%
  ungroup()

## This second grouping groups by year and site
## The summarise here is calculating the mean for groups which have the same year and site value
## This condenses the data down to have one value for each year at each capture site

condensed_data <- grouped_data %>%
  group_by(Year, Site) %>%
  summarise(across(.cols = everything(), .fns = ~mean(., na.rm = TRUE), .names = "Mean_{col}"), .groups = "drop") %>%
  ungroup()

## This is saved to a new dataframe using write.csv

write.csv(condensed_data, "SiteOneCondensedMean.csv", row.names = FALSE)

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

## As Simpson diversity couldn't be calculated using the data frame created above, an alternative was made
## This alternative summed the values at each step instead of averaging them as the Simpson diversity calculation required whole numbers
## The same grouping functions were used for step one but with ~sum instead of ~mean


original_data <- read.csv("C:/Users/harry/Documents/MastersDataAnalysis/Current/SiteOneDuplicatedRemoved.csv")

grouped_data <- original_data %>%
  group_by(Year, Site, Season) %>%
  summarise(across(.cols = everything(), .fns = ~sum(., na.rm = TRUE), .names = "{col}"), .groups = "drop") %>%
  ungroup()

condensed_data <- grouped_data %>%
  group_by(Year, Site) %>%
  summarise(across(.cols = everything(), .fns = ~sum(., na.rm = TRUE), .names = "Sum_{col}"), .groups = "drop") %>%
  ungroup()


write.csv(condensed_data, "SiteOneCondensedSum.csv", row.names = FALSE)
