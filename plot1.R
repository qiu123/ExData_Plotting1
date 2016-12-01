## This file is for producing plot1

## Creat a new folder named data
if(!file.exists("./data")){dir.create("./data")}
setwd("./data")

## Load the dataset required
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the useful data
subdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates and times
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")

## Plot1
png("plot1.png", width=480, height=480)
title <- "Global Active Power"
hist(subdata$Global_active_power, 
           col="red", 
           main="Global Active Power", 
           xlab=paste(title, " (kilowatts)"), 
           ylab="Frequency"
     )

## Close the .PNG graphic device
dev.off()
