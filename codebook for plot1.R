Step 1:

library(data.table)
library(dplyr)
library(lubridate)

Saving file to working directory and opening within R:

url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
> destfile <- "/Users/aaronsuzar/Documents/Data Science Coursera/Working Directory/household_power_consumption.zip"
> download.file(url, destfile)

## Reads in data table from file the subsets data for specified dates:
> read_in <- data.table::fread(input = "household_power_consumption.txt"
                              , na.strings="?")

##Prevents histogram from printing in scientific notation:
> read_in[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

##Change Date Column to Date Type:
> read_in[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

##Filter Dates for 2007-02-01 and 2007-02-02:
> read_in <- read_in[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

##Opening Quartz:
quartz()

##Plot 1:
> png("plot1.png", width=480, height=480)
> hist(read_in[, Global_active_power], main="Global Active Power", 
+      xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


