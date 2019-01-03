#Plot 1
###########################################################################################
#set directory

setwd("C:/Users/zafsre/OneDrive - SAS/Desktop/Coursera/data")

###########################################################################################
#read data set

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_subset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

data_subset$Date <- as.Date(data_subset$Date, format="%d/%m/%Y")

###########################################################################################
#create plot

hist(data_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

###########################################################################################
#create png file

png("plot1.png", width=480, height=480)

dev.off()

###########################################################################################