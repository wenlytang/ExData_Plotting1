mydata <- read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
closeAllConnections()
mydata$DateTime <- paste(mydata$Date, mydata$Time, sep = " ")
mydata$DateTime <- strptime(mydata$DateTime, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2), mar = c(4,4,2,1))
with(mydata, plot(DateTime, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power"))
with(mydata, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(mydata, plot(DateTime, Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering"))
lines(mydata$DateTime, mydata$Sub_metering_2, col = "red")
lines(mydata$DateTime, mydata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
with(mydata, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()