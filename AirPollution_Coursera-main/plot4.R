#Written by Milton Leal
#Exploratory Data Analysis - Coursera - John Hopkins University
#Project 2 - Week 4

#PLOT 4

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

# merge the two data sets 
if(!exists("NEISCC")){
  
  subset1<- select(NEI, SCC, Emissions, year)
  subset2<- select(SCC, SCC, Short.Name)
  NEISCC <- merge(subset1, subset2, by="SCC")

}

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)


png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()

