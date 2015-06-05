## Loads Electric Power Consumption dataset in order to recreate plot1 of the Exploratory Data Analysis - Course Project 1

library(data.table)

## ETL (fast read from file, subset data)
data <- fread("data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

## Tidy data (clean dates, add datetime column)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

## Test plot on screen
par(mfrow=c(1,1), bg="transparent")
hist(as.numeric(data$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red",)

## Plot to png
png("plot1.png", height=480, width=480)
par(mfrow=c(1,1), bg="transparent")
hist(as.numeric(data$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red",)
dev.off()
