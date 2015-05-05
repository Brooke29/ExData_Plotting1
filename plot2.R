#unzip  Electric power consumption file into ExData_Plotting1 directory.
#set working directory to ExData_Plotting1

require(sqldf)
require (tcltk)

# open a subset of the data 1st and the 2nd of February 2007: 

data<-read.csv.sql( file="household_power_consumption.txt", 
                    sep=";", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                    header=TRUE)
# add new column that combines date and time, converted to POSIXlt:

new<-paste (data$Date, data$Time)
data$DateTime<-strptime(new, "%d/%m/%Y %H:%M:%S")

# open png device:

png(file="plot2.png")

# create the plot of Global Active Power vs date/time:

plot(data$DateTime, data$Global_active_power, type="l", 
     bg="white", ann=FALSE)
title(ylab="Global Active Power (kilowatts)")

# close png device

dev.off()
