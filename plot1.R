mydata <- read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")
closeAllConnections()
mydata$DateTime <- paste(mydata$Date, mydata$Time, sep = " ")
mydata$DateTime <- strptime(mydata$DateTime, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(mydata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
