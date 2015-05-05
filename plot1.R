#unzip  Electric power consumption file into ExData_Plotting1 directory.
#set working directory to ExData_Plotting1

require(sqldf)
require (tcltk)

# open a subset of the data between the dates 

data<-read.csv.sql( file="household_power_consumption.txt", 
                    sep=";", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                    header=TRUE)

# open png device:

png(file="plot1.png")

# create the histogramme of variable Global Active Power:

hist(data$Global_active_power, main="Global Active Power", 
     col = "red", bg= "white", xlab = "Global Active Power (kilowatts)")
# close png device

dev.off()