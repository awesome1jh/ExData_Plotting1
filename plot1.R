## read in power_consumption file and produce histogram of Power used
## read in text file
setClass('myDate') # define a class for the Date to convert the format
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
# set up vector of column types
columns <- c('myDate','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
# read in file
HPC <- read.csv("~/Coursera/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",colClasses=columns)
HPC <- subset(HPC, Date=="2007-02-01" | Date=="2007-02-02") #  keep only data from two dates
# display histogram of Global Active Power
png(file="plot1.png") # open png file
hist(HPC$Global_active_power,col="red",main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() #close png file