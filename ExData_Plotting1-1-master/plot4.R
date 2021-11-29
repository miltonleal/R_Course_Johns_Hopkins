#Written by Milton Leal
#Exploratory Data Analysis - Coursera - John Hopkins University
#Project 1 - Week 1

#PLOT 4

library(tidyr)
library(dplyr)

#getting the data

if (!dir.exists("data")){
        dir.create("data")
}

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("./data/exdata_data_household_power_consumption.zip")){
        download.file(fileurl, "./data/exdata_data_household_power_consumption.zip", method = "curl")
        unzip("./data/exdata_data_household_power_consumption.zip", exdir = paste(getwd(),"/data", sep = ""))
        
}

file <- read.table(file="data/household_power_consumption.txt",
                   header=TRUE,sep=";")

#subsets wanted dates
realdata <- subset(file, Date=="1/2/2007" | Date=="2/2/2007")

#unites data and time
realdata <- unite(realdata, date_time, 1:2, sep=" ")

#converts data and time do POSIXct

realdata$date_time <- as.POSIXct(realdata$date_time, 
                                 format = "%d/%m/%Y %H:%M:%S", tz = "GMT")

#converts character to numeric
realdata<-realdata %>% mutate_if(is.character,as.numeric)

## plot code

png(filename="plot4.png")

par(mfrow = c(2,2), mar=c(4,4,3,2))

plot(realdata$date_time, realdata$Global_active_power, type = "l", 
     xlab = "",ylab = "Global Active Power (kilowatts)")

plot(realdata$date_time, realdata$Voltage, type = "l", 
     xlab="datetime", ylab= "Voltage")

plot(realdata$date_time, realdata$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", type="l")
lines(realdata$date_time, realdata$Sub_metering_2, 
      col="red",type="l")
lines(realdata$date_time, realdata$Sub_metering_3, 
      col="blue",type="l")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(realdata$date_time, realdata$Global_reactive_power, type = "l", 
     xlab="datetime", ylab= "Global_reactive_power")

dev.off()
