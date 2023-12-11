## The code below was ran using the original data from each capture site to remove birds that appeared more than once in a given year
## This means the code below was ran seven seperate times, once for each capture site providing an output file for each capture site

## The csv data is brought in for the capture site
df <- read.csv("C:/Users/harry/Documents/MastersDataAnalysis/OriginalData.csv")

## the dplyr package is necessary as it provides some of the functions used below
library(dplyr)

## The code below is used to create a function which can be run on the data to remove the duplicates
## Firstly a new dataframe is created from the df data frame we input at the start
## The data in this 'duplicates' dataframe is grouped by 'Year' and 'Ring' to separate out the data for birds which appear more than one time in the year
## The mutate function then assigns a value 'n' to these rows which are repeated so that the first appearance is 1, the second is 2 etc.
## A filter is then applied to remove all rows which have a 'n' value of 1. This removes the original entry for each of the birds from this 'duplicates' data frame.
## The select(-n) just removes the n column so it's not present in the final dataset
## A third dataframe called 'removed_value' is then created which contains the duplicated values from the ring column which need to be removed from the original data frame.
## The next step performs an anti_join to return only the rows from the original dataframe that do not have matching rows in the duplicates dataframe, effectively removing the duplicates.
## However, the filter function ensures that only rows where both the year is unique, and the ring value is in the removed values dataset are removed.
## The ensures that the anti_join retains the first appearance while removing all further appearances.


remove_duplicates <- function(df) {
  duplicates <- df %>% 
    group_by(Year, Ring) %>% 
    mutate(n = row_number()) %>%
    filter(n > 1) %>% 
    select(-n)
  
  removed_value <- duplicates$Ring[duplicated(duplicates$Ring)]
  
  df %>% 
    anti_join(duplicates) %>%
    filter(!(Year %in% duplicates$Year & Ring %in% removed_value))
}

## The next line runs the function created above on the df and creates a new data frame from this called 'new_df' which is then saved using the write.csv function.

new_df <- remove_duplicates(df)

write.csv(new_df,"C:/Users/harry/Documents/MastersDataAnalysis/DataNoDuplicates.csv", row.names = FALSE)
