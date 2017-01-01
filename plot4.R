png(filename = "plot4.png",
    width = 480, 
    height = 480)

par(mfcol = c(2,2))

plot(datetime, power_set$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(datetime, power_set$Sub_metering_1,
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

plot(datetime, power_set$Voltage,
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

plot(datetime, power_set$Global_reactive_power, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()