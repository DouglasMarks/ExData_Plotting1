par(mfrow = c(1,1))
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") # read in data
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y"))
LV <-  data$Date==as.Date(strptime("01/02/2007", format="%d/%m/%Y")) | data$Date==as.Date(strptime("02/02/2007", format="%d/%m/%Y"))
D2 <- data[LV,]
NV <- strptime(paste(D2$Date,D2$Time), format="%Y-%m-%d %H:%M:%S")
plot(NV, D2$Sub_metering_1, type="l", ylab="Energy Sub Metering", lwd=1)
lines(NV, D2$Sub_metering_2, col="red", lwd=1)
lines(NV, D2$Sub_metering_3, col="blue", lwd=1)
legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "Plot3.png")
dev.off()