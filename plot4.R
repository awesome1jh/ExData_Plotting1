## read in power_consumption file and produce line graphs of sub-metering usage
## read in text file
setClass('myDate') # define a class for the Date to convert the format
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
# set vector of column types
columns <- c('myDate','character','numeric','numeric','numeric','numeric',
             'numeric','numeric','numeric')
# read input file
HPC <- read.csv("~/Coursera/household_power_consumption.txt",
                header=TRUE, sep=";", na.strings="?",colClasses=columns)
#  keep only data from two dates
HPC <- subset(HPC, Date=="2007-02-01" | Date=="2007-02-02") 

png(file="plot4.png") # open png file
n <- dim(HPC)[1] # find number of rows in HPC
x <- paste(HPC[1:n,1],HPC[1:n,2]) # paste together the date and time
x <- as.POSIXct(strptime(x,format = "%Y-%m-%d %H:%M:%S"))
par(mfcol=c(2,2))
# open empty plot for 1st figure
plot(x,HPC$Global_active_power, type="n",xlab="",ylab="Global Active Power") # open empty plot
lines(x,HPC$Global_active_power) # put on line plot
# open empty plot for 2nd figure
plot(x,HPC$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering") 
lines(x,HPC$Sub_metering_1, col="black") # put on line plot
lines(x,HPC$Sub_metering_2, col="red") # put on line plot
lines(x,HPC$Sub_metering_3, col="blue") # put on line plot
# add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty= c(1,1,1),col = c("black","red","blue"),cex=0.85,bty="n")
# plot Voltage in top right position
plot(x,HPC$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(x,HPC$Voltage,lwd=0.5)
 # plot Global_reactive_power in bottom right
plot(x,HPC$Global_reactive_power, type="n",lwd=0.5, 
     xlab="datetime",ylab="Global_reactive_power")
lines(x,HPC$Global_reactive_power,lwd=0.5)
dev.off() #close png file