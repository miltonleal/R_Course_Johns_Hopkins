#Written by Milton Leal
#Exploratory Data Analysis - Coursera - John Hopkins University
#Project 2 - Week 4

#PLOT 5

library(ggplot2)
library(dplyr)

#getting the data

if (!dir.exists("data")){
  dir.create("data")
}

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
if (!file.exists("./data/exdata_data_NEI_data.zip")){
  download.file(fileurl, "./data/exdata_data_NEI_data.zip", method = "curl")
  unzip("./data/exdata_data_NEI_data.zip", exdir = paste(getwd(),"/data", sep = ""))
  
}

#reading the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

baltcitymary.emissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]

baltcitymary.emissions.byyear <- summarise(group_by(baltcitymary.emissions, year), 
                                           Emissions=sum(Emissions))

png("plot5.png", width=640, height=480)
g <-ggplot(baltcitymary.emissions.byyear, 
       aes(x=factor(year), y=Emissions,fill=year, 
           label = round(Emissions,2))) + geom_bar(stat="identity") + 
  xlab("year") +ylab(expression("total PM"[2.5]*" emissions in tons")) + 
  ggtitle("Emissions from motor vehicle sources in Baltimore City") + 
  geom_label(aes(fill = year),colour = "white", fontface = "bold")
print(g)
dev.off()