# Plot 3
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subData$Global_active_power)
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering_1 <- as.numeric(subData$Sub_metering_1)
sub_metering_2 <- as.numeric(subData$Sub_metering_2)
sub_metering_3 <- as.numeric(subData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, sub_metering_1, col="green", type="l", xlab="", ylab="Energy sub metering")
lines(datetime, sub_metering_2, col="red", type="l")
lines(datetime, sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1","Sub_metering_1","Sub_metering_3"), col=c("black", "red", "blue"), lwd=2.5)
dev.off()
