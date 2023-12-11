##The following section displays and explains the code used to condense the dataset from one row per individual capture down to one row per capture date

## The 'Data' spreadsheet contained the original dataset with a single row for each individual capture
## The 'DataChange' spreadsheet had columns and rows labelled in the desired output format
## Prior to this step I used Excel's find tool (Ctrl + F) set to identify unique combinations in the day, month, and year columns to locate every unique capture date in the original 'Data' spreadsheet 
## These unique capture dates were then put as rows in the 'DataChange' sheet with each species captured having a column
## This created a table where a tally could be taken for the number of each species caught on every capture date
## As there were seven different capture sites and they needed to remain separated by this in the new 'DataChange' dataset the original 'Data' spreadsheet was separated into seven spreadsheets, one for each site.
## This means that the code below was ran seven times, once on each of the seven spreadsheets, and the outputs were then manually pasted into a final 'DataChange' spreadsheet with a 'Site' column.

Data <- read.csv("C:/Users/harry/Documents/MastersDataAnalysis/OriginalData.csv")
DataChange <- read.csv("C:/Users/harry/Documents/MastersDataAnalysis/NewDates.csv")
attach(MeganData)

## The code below makes a new 'Date' column which allows the for loop to search the new spreadsheet for the correct row
DataChange$Date <- paste(DataChange$Year, DataChange$Month, DataChange$Day, sep="")

## This just sets x and i to default values (mainly so they are then identified as an integer and string respectively)
x = 1
i = "Test"

## This is the main section which involves a for loop running through every line of the 'Data' sheet and adding to the tally in the correct row and column in the new spreadsheet
## The arguments of the for loop were set to 'i in Data$Species' so that for each row the for loop ran over it would change the variable i to be the species name for that row
## This is achieved by first updating the 'date' variable using the day (a), month (b), and year (c), columns and using the paste function to merge them into one date value stored in the 'date' variable
## 'date' could then be checked against the 'Date' column in the 'DataChange' spreadsheet to locate the row number (set to 'rownum') which it needed to be added to
## 'rownum' and 'i' were then used to add 1 to the correct row and column in the 'DataChange', increasing the tally count for that species on that capture date by 1
## At the end of the loop it adds one to the x value to signify it is moving down a line and this allows the loop to run through all lines of the main 'Data' spreadsheet
for (i in Data$Species) {
  a <- Data[x, 5]
  b <- Data[x, 4]
  c <- Data[x, 3]
  date <- paste(a, b, c, sep="")
  rownum <- which(grepl(date, DataChange$Date))
  DataChange[rownum, i] <- DataChange[rownum, i] + 1
  x = x+1
}

## Now the newly edited spreadsheet complete with all the species quantities is saved to a new speadsheet (DataChanged)
write.csv(DataChange,"C:/Users/harry/Documents/MastersDataAnalysis/DataChanged.csv", row.names = FALSE)
