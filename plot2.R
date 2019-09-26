#Extract the dataset.
fileName <- "exdata_data_household_power_consumption.zip"
unzip(fileName)

#Read the data.
data <- read.table("household_power_consumption.txt", header=TRUE, 
                   sep=";", stringsAsFactors=FALSE, na.strings="?")

#Subset the data from the dates 2007-02-01 and 2007-02-02.
subsetData <- subset(data, data$Date=="2/2/2007"|data$Date=="1/2/2007")

# Create "plot2.png"
DateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(DateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
