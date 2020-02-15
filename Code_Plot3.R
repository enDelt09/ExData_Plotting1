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

## Plot 3: The other line thingy
with(tsub, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()