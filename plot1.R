# Read the data from the "household_power_consumption.txt" file which only contains the observations for 1/02/2007 and 2/02/2007
setwd("E:\\Coursera\\04. Exploratory Data Analysis\\Project 1")
data=read.table("household_power_consumption.txt", header=T, sep = ";")

# Transform the columns 1 and 2, "Date" and "Time" into one column "Date", which contains date and time as "POSIXct" "POSIXt" 
dt = paste(as.character(data[,1]) , as.character(data[,2]))
dt2=strptime(dt, format = "%d/%m/%Y %H:%M:%S")
data[,2]=NULL
data[,1]=as.data.frame(dt2)



# Create plot 1
png('plot1.png')
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()