## plot2.R produces plot2.png for EDA Course Project 1.


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


## convert Date and Time columns to Date and POSIXct classes respectively.

dataset$Time <- strptime(paste(dataset$Date, dataset$Time, sep = " "),
                         "%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")


## plot scatterplot, plot2

library(datasets)

png(filename = "plot2.png", width = 480, height = 480)
plot(dataset$Time, dataset$Global_active_power, type = "l", 
        ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()