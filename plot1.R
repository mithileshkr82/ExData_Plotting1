two_day<-read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";")
header <- read.table("household_power_consumption.txt", nrows=1,sep=";", stringsAsFactors = FALSE)
colnames(two_day) <- as.character(header[1,])

png(filename = "plot1.png", width = 480, height = 480, units="px")
hist(two_day$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
