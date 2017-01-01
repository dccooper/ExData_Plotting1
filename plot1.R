## Import Data
power <- fread("data/household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?", sep = ";")

## Convert to new date format variable
power$date2 <- as.Date( as.character(power$Date), "%d/%m/%Y")

## Subset by date
power_set <- subset(power_set, date2 <= "2007-02-02" & date2 >= "2007-02-01")


## Make the plot
png(filename = "plot1.png", ## Set the output format
      width = 480, 
      height = 480)

hist(power_set$Global_active_power, ## Set the plot type and parameters
      main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)", 
      ylab = "Frequency",
      col = "red")
dev.off() ## Sign off