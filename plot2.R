## read in power_consumption file and produce graph of Power Consumption by time
## read in text file
setClass('myDate') # define a class for the Date to convert the format
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
# set up column types
columns <- c('myDate','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
# read in data
HPC <- read.csv("~/Coursera/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",colClasses=columns)
HPC <- subset(HPC, Date=="2007-02-01" | Date=="2007-02-02") #  keep only data from two dates
# Global Active Power by time
png(file="plot2.png") # open png file
n <- dim(HPC)[1] # find number of rows in HPC
x <- paste(HPC[1:n,1],HPC[1:n,2]) # paste together the date and time
x <- as.POSIXct(strptime(x,format = "%Y-%m-%d %H:%M:%S")) # convert date time to a number for graphing
plot(x,HPC$Global_active_power, type="n",xlab="",ylab="Global Active Power (kilowatts)") # open empty plot
lines(x,HPC$Global_active_power) # put on line plot
dev.off() #close png file