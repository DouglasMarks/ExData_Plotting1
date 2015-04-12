data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") # read in data
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y"))
LV <-  data$Date==as.Date(strptime("01/02/2007", format="%d/%m/%Y")) | data$Date==as.Date(strptime("02/02/2007", format="%d/%m/%Y"))
D2 <- data[LV,]
par(mfrow = c(2, 2))
plot(D2$Time, D2$Global_active_power, ylab="Global Active Power (kilowatts)")
plot(D2$Time, D2$Voltage, ylab="Voltage", xlab="datetime")
plot(D2$Time, D2$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", lwd=1)
lines(D2$Time, D2$Sub_metering_2, col="red", lwd=1)
lines(D2$Time, D2$Sub_metering_3, col="blue", lwd=1)
legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(D2$Time, D2$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, "Plot4.png")
dev.off()