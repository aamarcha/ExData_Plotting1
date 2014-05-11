
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

# Plot histogram of Global Active Power
png(filename="plot1.png", height = 480,width = 480)
with(powerConsumption, hist(as.numeric(Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))
dev.off()