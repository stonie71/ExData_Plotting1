## plot4.R produces plot4.png for EDA Course Project 1.


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


## plot 4 x scatterplots: plot4

library(datasets)

png(filename = "plot4.png")
par(mfrow = c(2, 2), mar = c(5, 5, 2, 1))
with (dataset, {
        plot(dataset$Time, dataset$Global_active_power, type = "l", 
             ylab = "Global Active Power", xlab = "")
        plot(dataset$Time, dataset$Voltage, type = "l", 
             ylab = "Voltage", xlab = "datatime")
        plot(dataset$Time, dataset$Sub_metering_1, type = "l",
             ylab = "Energy sub metering", xlab = "", col = "black")
        points(dataset$Time, dataset$Sub_metering_2, type = "l",
               col = "red")
        points(dataset$Time, dataset$Sub_metering_3, type = "l",
               col = "blue")
        legend("topright", lty = 1, col = c("black", "blue", "red"), 
               legend =  names(dataset)[7:9], bty = "n")
        plot(dataset$Time, dataset$Global_reactive_power, bty = "o", type = "l",
             ylab = names(dataset)[4], xlab = "datatime")
})
dev.off()
