## Loads Electric Power Consumption dataset in order to recreate plot3 of the Exploratory Data Analysis - Course Project 1

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
with(data, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col='Red')
  lines(Sub_metering_3~Datetime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Cant copy due to legend placement bug, replot in png
png("plot3.png", height=480, width=480)
par(mfrow=c(1,1), bg="transparent")
with(data, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col='Red')
  lines(Sub_metering_3~Datetime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
