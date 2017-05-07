
dataFile <- "./data/household_power_consumption.txt"
#reading the data file
consumpData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#selecting data only from the dates 2007-02-01 and 2007-02-02 
subsetConsumpData <- consumpData[consumpData$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(subsetConsumpData$Date, subsetConsumpData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# GlobalActivePower data
globalActivePower <- as.numeric(subsetConsumpData$Global_active_power)

# GlobalReactivePower data
globalReactivePower <- as.numeric(subsetConsumpData$Global_reactive_power)

# Voltage data
voltage <- as.numeric(subsetConsumpData$Voltage)

#SubMetering1 data
submetering1 <- as.numeric(subsetConsumpData$Sub_metering_1)

#SubMetering2 data
submetering2 <- as.numeric(subsetConsumpData$Sub_metering_2)

#SubMetering3 data
submetering3 <- as.numeric(subsetConsumpData$Sub_metering_3)

#Plot the data
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

#Plot the GlobalActivePower data
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

#Plot the Voltage data
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot the Submetering data
plot(datetime, submetering1, type="l", xlab="", ylab="Energy sub metering" )
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))

#Plot the GlobalReactivePower data
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
