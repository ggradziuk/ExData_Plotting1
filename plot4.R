data <- read.table("household_power_consumption.txt", header=T, sep=";",
                   colClasses = rep(c("character", "numeric"), c(2,7)),
                   na.strings = "?")
data <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")


png(file="plot4.png")
par(mfcol=c(2,2))
### PLOT 1 ###
plot(data$Time, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

### PLOT 2 ###
plot(data$Time, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
with(data, {
    points(Time, Sub_metering_1, type="l", col="black")
    points(Time, Sub_metering_2, type="l", col="red")
    points(Time, Sub_metering_3, type="l", col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=c(1,1),
       legend=c("Sub_metering1","Sub_metering2","Sub_metering3"))

### PLOT 3 ###
plot(data$Time, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

### PLOT 4 ###
plot(data$Time, data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()