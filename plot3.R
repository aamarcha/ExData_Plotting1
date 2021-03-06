#discover file properties
initial  <- read.csv("./data/household_power_consumption.txt", sep=";", nrows =100, na.strings ="?")
colClasses  <-  sapply(initial,class)

#read entire file, I have enough power 
powerConsumption  <- read.csv("./data/household_power_consumption.txt", sep=";", colClasses = colClasses, na.strings ="?")

#construct a  Time Object by mixing Date and Time characters
powerConsumption$DateTime  <- paste(powerConsumption$Date, powerConsumption$Time, sep=" ")
powerConsumption$DateTime  <- as.POSIXct(strptime(powerConsumption$DateTime, format = "%d/%m/%Y %H:%M:%S"))

#subsetting concerned data
powerConsumption  <- subset(powerConsumption, DateTime >= as.POSIXct("2007-02-01") &  DateTime < as.POSIXct("2007-02-3"))
# Plot 
png(filename="plot3.png", height = 480,width = 480)
with(powerConsumption, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(powerConsumption, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(powerConsumption, lines(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,col=c("black","red","blue"))
dev.off()