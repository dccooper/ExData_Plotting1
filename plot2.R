## Import Data
power <- fread("data/household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?", sep = ";")

## Convert to new date format variable
power$date2 <- as.Date( as.character(power$Date), "%d/%m/%Y")

## Subset by date
power_set <- subset(power_set, date2 <= "2007-02-02" & date2 >= "2007-02-01")

## Make new variable combining Date and Time
datetime <- strptime(paste(power_set$Date, power_set$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Set the plot output format
png(filename = "plot2.png",  
    width = 480, 
    height = 480)

## Set the plot type and parameters
plot(datetime, power_set$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()