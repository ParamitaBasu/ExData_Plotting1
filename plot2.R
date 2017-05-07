
dataFile <- "./data/household_power_consumption.txt"
#reading the data file
consumpData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#selecting data only from the dates 2007-02-01 and 2007-02-02 
subsetConsumpData <- consumpData[consumpData$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(subsetConsumpData$Date, subsetConsumpData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# GlobalActivePower data
globalActivePower <- as.numeric(subsetConsumpData$Global_active_power)

#Plot the GlobalActivePower data
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)" )
dev.off()
