#Plot 2
###########################################################################################
#set directory

setwd("C:/Users/zafsre/OneDrive - SAS/Desktop/Coursera/data")

###########################################################################################
#read data set

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_subset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

data_subset$Date <- as.Date(data_subset$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data_subset$Date), data_subset$Time)

data_subset$datetime <- as.POSIXct(datetime)

###########################################################################################
#create plot

with(data_subset, {
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

###########################################################################################
#create png file

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()

###########################################################################################