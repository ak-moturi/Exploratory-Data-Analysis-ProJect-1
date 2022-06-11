# Read data into R and subset the dates of interest
filepath <- "./data/household_power_consumption.txt"
powerdata <- read.table(filepath, header=TRUE, sep=";", stringsAsFactors=FALSE)
powersubset<-subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")


#Transorm variables into correct format for plotting
datetime <- strptime(paste(powersubset$Date, powersubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalpower <- as.numeric(powersubset$Global_active_power)
globalreactpower <- as.numeric(powersubset$Global_reactive_power)
voltage <- as.numeric(powersubset$Voltage)
submetering1 <- as.numeric(powersubset$Sub_metering_1)
submetering2 <- as.numeric(powersubset$Sub_metering_2)
submetering3 <- as.numeric(powersubset$Sub_metering_3)

#Setup graphic device for multiple plots
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Plot
plot(datetime, globalpower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalreactpower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
