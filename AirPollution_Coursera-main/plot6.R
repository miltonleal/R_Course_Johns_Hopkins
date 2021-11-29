#Written by Milton Leal
#Exploratory Data Analysis - Coursera - John Hopkins University
#Project 2 - Week 4

#PLOT 6

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

baltcitymary.emissions<-summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
losangelscal.emissions<-summarise(group_by(filter(NEI, fips == "06037"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))

baltcitymary.emissions$County <- "Baltimore City, MD"
losangelscal.emissions$County <- "Los Angeles County, CA"
both.emissions <- rbind(baltcitymary.emissions, losangelscal.emissions)

png("plot6.png", width=640, height=480)

g<-ggplot(both.emissions, 
          aes(x=factor(year), y=Emissions, fill=County,
              label = round(Emissions,2))) + geom_bar(stat="identity") + 
  facet_grid(County~., scales="free") +
  ylab(expression("total PM"[2.5]*" emissions in tons")) + 
  xlab("year") +
  ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))+
  geom_label(aes(fill = County),colour = "white", fontface = "bold")

print(g)

dev.off()