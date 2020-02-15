## This is for Coursera - Exploratory Data Analysis - Week 1 - Project 1

##Loading and cleaning the data

t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                colClasses = c('character','character','numeric','numeric','numeric',
                               'numeric','numeric','numeric','numeric'), comment.char = "", quote ='\"')

## We only want complete observations so we subset...
t <- t[complete.cases(t),]

## Filtering t from 2/1/2007 to 2/2/2007
tsub <- subset(t, Date %in% c("1/2/2007","2/2/2007"))

## The date field needs to be converted to an actual date data type
tsub$Date <- as.Date(tsub$Date, "%d/%m/%Y")

datetime <- paste(as.Date(tsub$Date), tsub$Time)
tsub$datetime <- as.POSIXct(datetime)


##############################################################################################################
## Now we begin constructing the plots
##############################################################################################################

## Plot 3: The four graphs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(tsub, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
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
## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()