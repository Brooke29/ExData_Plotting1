#unzip  Electric power consumption file into ExData_Plotting1 directory.
#set working directory to ExData_Plotting1

require(sqldf)
require (tcltk)

# open a subset of the data between the dates 

data<-read.csv.sql( file="household_power_consumption.txt", 
                    sep=";", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                    header=TRUE)
# add new column that combines date and time, converted to POSIXlt:

new<-paste (data$Date, data$Time)
data$DateTime<-strptime(new, "%d/%m/%Y %H:%M:%S")

# open png device:

png(file="plot4.png")

#set the parameters for 4 plots:

par(mfrow=c(2,2))

# create the plot of Global Active Power vs date/time:

plot(data$DateTime, data$Global_active_power, type="l", 
     bg="white", ann=FALSE)
title(ylab="Global Active Power (kilowatts)")

#create a plot of Voltage vs. date/time:

plot(data$DateTime, data$Voltage, type="l", 
     bg="white", ylab="Voltage", xlab="datetime")

# create the plot of of variables Sub_metering 1, 2 and 3 vs. date/time:

plot(data$DateTime, data$Sub_metering_1, bg="white", type="n",
     ann=FALSE)
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
title(ylab="Energy sub metering")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=2,col=c("black", "red", "blue"))
# create the plot of Global Reactive Power vs date/time:

plot(data$DateTime, data$Global_reactive_power,type="l", 
     bg="white", xlab="datetime", ylab="Global_reactive_power")

# close png device

dev.off()