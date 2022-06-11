# Read data into R and subset the dates of interest
filepath <- "./data/household_power_consumption.txt"
powerdata <- read.table(filepath, header=TRUE, sep=";", stringsAsFactors=FALSE)
powersubset<-subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

# Transform the date and time variable into objects of type Date and POSIXlt
datetime <- strptime(paste(powersubset$Date, powersubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalpower <- as.numeric(powersubset$Global_active_power)

#Set graphic device and plot
png("plot2.png", width=480, height=480)
plot(datetime, globalpower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
