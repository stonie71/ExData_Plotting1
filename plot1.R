## plot1.R produces plot1.png for EDA Course Project 1.


## set filename, readin column header names to 'cols' and then load rows into
## dataset. Use skip and nrows to only load rows around the days Feb 1 & 2, 
## 2007, rather than all 1 Million+ rows.

file_name <- "./household_power_consumption.txt"
cols <- names(read.csv(file_name, sep = ";", na.strings = "?", nrows = 1,
                              header = TRUE))
dataset <- read.csv(file_name, sep = ";", na.strings = "?", col.names = cols,
                    skip = 66500, nrows = 4000, header = TRUE)


## retain rows for Feb 1 & Feb 2, 2007, removing all other rows from dataset.

dataset <- dataset[(dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007"), ]


## plot histogram: plot1

library(datasets)

png(filename = "plot1.png", width = 480, height = 480)
hist(dataset$Global_active_power, xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()