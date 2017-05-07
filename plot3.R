
dataFile <- "./data/household_power_consumption.txt"
#reading the data file
consumpData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#selecting data only from the dates 2007-02-01 and 2007-02-02 
subsetConsumpData <- consumpData[consumpData$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(subsetConsumpData$Date, subsetConsumpData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#SubMetering1 data
submetering1 <- as.numeric(subsetConsumpData$Sub_metering_1)

#SubMetering2 data
submetering2 <- as.numeric(subsetConsumpData$Sub_metering_2)

#SubMetering3 data
submetering3 <- as.numeric(subsetConsumpData$Sub_metering_3)

#Plot the Submetering data
png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type="l", xlab="", ylab="Energy sub metering" )
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))
dev.off()
