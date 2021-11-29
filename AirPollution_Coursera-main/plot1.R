#Written by Milton Leal
#Exploratory Data Analysis - Coursera - John Hopkins University
#Project 2 - Week 4

#PLOT 1

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

#subsetting
year_emission <- data.frame(NEI$year, NEI$Emissions)

#sums emissions by year
total_agreggate <- aggregate(Emissions ~ year, NEI, sum)

#makes the plot
png("plot1.png")

bar_colors = c("blue", "red", "green", "magenta")

barplot(height=total_agreggate$Emissions/1000,
        names.arg=total_agreggate$year, xlab="years", 
        ylab=expression('total PM'[2.5]*' emission in kilotons'),
        main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),
        col=bar_colors)

dev.off()


