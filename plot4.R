two_day<-read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";")
header <- read.table("household_power_consumption.txt", nrows=1,sep=";", stringsAsFactors = FALSE)
colnames(two_day) <- as.character(header[1,])

png(filename = "plot4.png", width = 480, height = 480, units="px")
two_day$POSIXdt <- paste(two_day$Date, two_day$Time)
two_day$POSIXdt <- strptime(two_day$POSIXdt, format="%d/%m/%Y %H:%M:%S")



par(mfcol=c(2,2))

#1st Plot (Plot 2)
plot(two_day$POSIXdt, two_day$Global_active_power, type="n", xlab = "", ylab = "Global Active Power")
lines(two_day$POSIXdt, two_day$Global_active_power)

#2nd Plot (Plot 3)
plot(two_day$POSIXdt, two_day$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
lines(two_day$POSIXdt, two_day$Sub_metering_1)
lines(two_day$POSIXdt, two_day$Sub_metering_2, col="red")
lines(two_day$POSIXdt, two_day$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metereing_3"), lty=c(1,1,1), lwd=c(1, 1), col=c("black", "red", "blue"), bty="n")

#3rd plot
plot(two_day$POSIXdt, two_day$Voltage, xlab = "datetime", ylab = "Voltage", type="n")
lines(two_day$POSIXdt, two_day$Voltage)

#4th plot
plot(two_day$POSIXdt, two_day$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="n")
lines(two_day$POSIXdt, two_day$Global_reactive_power)

dev.off()