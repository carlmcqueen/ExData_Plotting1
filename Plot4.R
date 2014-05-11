## Carl McQueen
## completed 5.11.14

## the data
data <- read.table("./data/household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
## change the factor to a date
data$Date <- strptime(data$Date,"%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power,7)
## broken, change time to a time function
## data$Time <- strptime(data$Time, "%H:%M:%S")

##make a subset of the data, based on the window of 1/2/2007 to 2/2/2007
startDt <- strptime("1/2/2007","%d/%m/%Y")
endDt <- strptime("2/2/2007","%d/%m/%Y")
## subset of data: reduces to 46,080 rows of data
data <- subset(data,Date >= startDt & Date <= endDt)

png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

plot(data$Global_active_power, type="l",xaxt="n",xlab="", ylab="Global Active Power")
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat"))

plot(data$Voltage, type="l",xaxt="n",xlab="datetime", ylab="Voltage")
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat"))


with(data, {
        plot(Sub_metering_1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
        lines(x=Sub_metering_2, col="red")
        lines(x=Sub_metering_3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "transparent", bg="transparent")

plot(data$Global_reactive_power, type="l",xaxt="n",xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat"))

dev.off()