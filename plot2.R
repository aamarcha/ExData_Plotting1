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
png(filename="plot2.png", height = 480,width = 480)
plot(powerConsumption$DateTime, as.numeric(powerConsumption$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()