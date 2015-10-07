## read in power_consumption file and produce line graphs of sub-metering usage
## read in text file
setClass('myDate') # define a class for the Date to convert the format
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
# set vector of column types
columns <- c('myDate','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
# read input file
HPC <- read.csv("~/Coursera/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",colClasses=columns)
HPC <- subset(HPC, Date=="2007-02-01" | Date=="2007-02-02") #  keep only data from two dates

png(file="plot3.png") # open png file
n <- dim(HPC)[1] # find number of rows in HPC
x <- paste(HPC[1:n,1],HPC[1:n,2]) # paste together the date and time
x <- as.POSIXct(strptime(x,format = "%Y-%m-%d %H:%M:%S"))

plot(x,HPC$Sub_metering_1, type="n",xlab="",ylab="Energy sub metering") # open empty plot
lines(x,HPC$Sub_metering_1, col="black") # put on line plot
lines(x,HPC$Sub_metering_2, col="red") # put on line plot
lines(x,HPC$Sub_metering_3, col="blue") # put on line plot
# add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty= c(1,1,1),col = c("black","red","blue"))
dev.off() #close png file