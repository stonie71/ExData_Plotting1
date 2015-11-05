filename <- "./ExData Plotting1/household_power_consumption.txt"
dataset <- read.csv(filename, sep = ";", na.strings = "?", col.names = dscol.names, skip = 66500, nrows = 4000, header = TRUE)
dataset <- dataset[(dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007"), ]
library(datasets)
hist(dataset$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "RED")