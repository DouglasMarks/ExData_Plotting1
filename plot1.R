data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") # read in data
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y"))
hist( as.numeric( as.character(
   subset(data, 
          Date>=as.Date(strptime("01/02/2007", format="%d/%m/%Y")) &
          Date<=as.Date(strptime("02/02/2007", format="%d/%m/%Y")))$Global_active_power)),
   xlab="Global Active Power (kilowatts)", col="red", 
   main="Global Active Power", breaks=12)
dev.copy(png,'Plot1.png')
dev.off()