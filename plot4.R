#Plot 3
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

par(mfrow=c(2,2), mar=c(4,4,2,1))

with(data_subset, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
###########################################################################################
#create png file

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()

###########################################################################################
