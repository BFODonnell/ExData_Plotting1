# Plot 4
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering_1 <- as.numeric(subData$Sub_metering_1)
sub_metering_2 <- as.numeric(subData$Sub_metering_2)
sub_metering_3 <- as.numeric(subData$Sub_metering_3)
voltage <- as.numeric((subData$Voltage))
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Upper left quadrant
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Upper right quadrant
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Lower left quadrant
plot(datetime, sub_metering_1, col="green", type="l", xlab="", ylab="Energy sub metering")
lines(datetime, sub_metering_2, col="red", type="l")
lines(datetime, sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1","Sub_metering_1","Sub_metering_3"), col=c("black", "red", "blue"), lwd=2.5)

# Lower right quadrant
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Voltage")
dev.off()