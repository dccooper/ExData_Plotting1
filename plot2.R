png(filename = "plot2.png",
    width = 480, 
    height = 480)

datetime <- strptime(paste(power_set$Date, power_set$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

plot(datetime, power_set$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()