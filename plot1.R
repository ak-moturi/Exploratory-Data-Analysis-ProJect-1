filepath <- "./data/household_power_consumption.txt"
powerdata <- read.table(filepath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powersubset<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalpower <- as.numeric(powersubset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
