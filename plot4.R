# Read the data from the "household_power_consumption.txt" file which only contains the observations for 1/02/2007 and 2/02/2007
setwd("E:\\Coursera\\04. Exploratory Data Analysis\\Project 1")
data=read.table("household_power_consumption.txt", header=T, sep = ";")

# Transform the columns 1 and 2, "Date" and "Time" into one column "Date", which contains date and time as "POSIXct" "POSIXt" 
dt = paste(as.character(data[,1]) , as.character(data[,2]))
dt2=strptime(dt, format = "%d/%m/%Y %H:%M:%S")
data[,2]=NULL
data[,1]=as.data.frame(dt2)



# Create plot 4
png('plot4.png')
par(mfrow = c(2,2))
plot(data$Date, data$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
plot(data$Date, data$Voltage, type='l', xlab="datetime", ylab="Voltage")
plot(data$Date, data$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
lines(data$Date, data$Sub_metering_2, type='l', col="red")
lines(data$Date, data$Sub_metering_3, type='l', col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"),bty = "n")
plot(data$Date, data$Global_reactive_power, type='l', ylab="Global_reactive_power", xlab="datetime")
dev.off()
