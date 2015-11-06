## plot3.R produces plot3.png for EDA Course Project 1.


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


## plot scatterplots: plot3

library(datasets)

png(filename = "plot3.png", width = 480, height = 480)
with(dataset, plot(dataset$Time, dataset$Sub_metering_1, type = "l",
                   ylab = "Energy sub metering", xlab = "", col = "black"))
with(dataset, points(dataset$Time, dataset$Sub_metering_2, type = "l",
                     col = "red"))
with(dataset, points(dataset$Time, dataset$Sub_metering_3, type = "l",
                     col = "blue"))
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend =  names(dataset)[7:9])
dev.off()