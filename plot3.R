# Read data into R and subset the dates of interest
filepath <- "./data/household_power_consumption.txt"
powerdata <- read.table(filepath, header=TRUE, sep=";", stringsAsFactors=FALSE)
powersubset<-subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

#Transfom data and time variables and make sSub Metering variables numeric
datetime <- strptime(paste(powersubset$Date, powersubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalpower <- as.numeric(powersubset$Global_active_power)
submetering1 <- as.numeric(powersubset$Sub_metering_1)
submetering2 <- as.numeric(powersubset$Sub_metering_2)
submetering3 <- as.numeric(powersubset$Sub_metering_3)

#Set graphic device and plot
png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
