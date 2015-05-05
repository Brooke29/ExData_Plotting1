#unzip  Electric power consumption file into ExData_Plotting1 directory.
#set working directory to ExData_Plotting1

require(sqldf)
require (tcltk)

# open a subset of the data for the 1st and the 2nd of February 2007:

data<-read.csv.sql( file="household_power_consumption.txt", 
                    sep=";", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                    header=TRUE)
# add new column that combines date and time, converted to POSIXlt:

new<-paste (data$Date, data$Time)
data$DateTime<-strptime(new, "%d/%m/%Y %H:%M:%S")

# open png device:

png(file="plot3.png")

# create the plot of variables Sub_metering 1, 2 and 3 vs. date/time:

plot(data$DateTime, data$Sub_metering_1, bg="white", type="n",
     ann=FALSE)
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
title(ylab="Energy sub metering")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=2,col=c("black", "red", "blue"))
       
# close png device

dev.off()
