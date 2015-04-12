par(mfrow = c(1,1))
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") # read in data
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y"))
LV <-  data$Date==as.Date(strptime("01/02/2007", format="%d/%m/%Y")) | data$Date==as.Date(strptime("02/02/2007", format="%d/%m/%Y"))
D2 <- data[LV,]
NV <- strptime(paste(D2$Date,D2$Time), format="%Y-%m-%d %H:%M:%S")
plot(NV, D2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
dev.copy(png, "Plot2.png")
dev.off()