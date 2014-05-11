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

## start the plot
png(filename="plot1.png",width=500,height=500,units="px")
hist(data$Global_active_power,col="red",ylab="Frequency",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()