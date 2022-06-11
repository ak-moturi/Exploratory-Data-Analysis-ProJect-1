# Read data into R and subset the dates of interest

filepath <- "./data/household_power_consumption.txt"
powerdata <- read.table(filepath, header=TRUE, sep=";", stringsAsFactors=FALSE)
powersubset<-subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

#Set graphic device as PNG
png("plot1.png", width=480, height=480)

#Plot histogram
globalpower <- as.numeric(powersubset$Global_active_power)
hist(globalpower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Switch off graphic device
dev.off()
