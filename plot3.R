## Import Data
power <- fread("data/household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?", sep = ";")

## Convert to new date format variable
power$date2 <- as.Date( as.character(power$Date), "%d/%m/%Y")

## Subset by date
power_set <- subset(power_set, date2 <= "2007-02-02" & date2 >= "2007-02-01")

## Make new variable combining Date and Time
datetime <- strptime(paste(power_set$Date, power_set$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Set the plot output format
png(filename = "plot3.png",
    width = 480, 
    height = 480)

## Set the plot type and parameters
plot(datetime, power_set$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

## Add additional lines
lines(datetime, power_set$Sub_metering_2,
      col = "red")
lines(datetime, power_set$Sub_metering_3,
      col = "blue")

## Add legend
legend("topright",
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      lty = c(1, 1, 1),
      col = c("black", "red", "blue"))

dev.off()