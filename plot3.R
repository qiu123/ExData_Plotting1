## This file is for producing plot3

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

## Plot3
png("plot3.png", width=480, height=480)
plot(subdata$datetime, subdata$Sub_metering_1, 
     type="l", # Draw lines instead of dots
     xlab="", # Empty x-label string
     ylab="Energy sub metering"
)
lines(subdata$datetime, subdata$Sub_metering_2, col="red")
lines(subdata$datetime, subdata$Sub_metering_3, col="blue")

## Add legend
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), 
       lwd=1 # Line width
)

## Close the .PNG graphic device
dev.off()
