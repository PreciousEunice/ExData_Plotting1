#Extract the dataset.
fileName <- "exdata_data_household_power_consumption.zip"
unzip(fileName)

#Read the data.
data <- read.table("household_power_consumption.txt", header=TRUE, 
                   sep=";", stringsAsFactors=FALSE, na.strings="?")

#Subset the data from the dates 2007-02-01 and 2007-02-02.
subsetData <- subset(data, data$Date=="2/2/2007"|data$Date=="1/2/2007")

# Create "plot3.png"
DateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(DateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DateTime, subMetering2, type="l", col="red")
lines(DateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()
