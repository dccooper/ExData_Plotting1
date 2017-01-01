## Import Data
power <- fread("data/household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?", sep = ";")

## Convert to new date format variable
power$date2 <- as.Date( as.character(power$Date), "%d/%m/%Y")

## Subset by date
power_set <- subset(power_set, date2 <= "2007-02-02" & date2 >= "2007-02-01")

## Make new variable combining Date and Time
datetime <- strptime(paste(power_set$Date, power_set$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Set the plot output format
png(filename = "plot4.png",
    width = 480, 
    height = 480)

## Set layout for multiple plots
par(mfcol = c(2,2))

## Set the plot type and parameters
plot(datetime, power_set$Global_active_power, ## Top left plot
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(datetime, power_set$Sub_metering_1, ## Bottom left plot
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(datetime, power_set$Sub_metering_2,
      col = "red")
lines(datetime, power_set$Sub_metering_3,
      col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"))

plot(datetime, power_set$Voltage, #Top right plot
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

plot(datetime, power_set$Global_reactive_power, #Bottom right plot
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()