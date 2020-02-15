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



##############################################################################################################
## Now we begin constructing the plots
##############################################################################################################

## Plot 1: The Historgram
hist(tsub$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
## Save file and close device
#dev.copy(png,"plot1.png", width=480, height=480)
#dev.off()
