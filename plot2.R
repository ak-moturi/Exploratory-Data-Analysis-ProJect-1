filepath <- "./data/household_power_consumption.txt"
powerdata <- read.table(filepath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powersubset<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(powersubset$Date, powersubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globaLpower <- as.numeric(powersubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalpower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
