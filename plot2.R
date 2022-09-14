data <- read.table("household_power_consumption.txt", header=T, sep=";",
                   colClasses = rep(c("character", "numeric"), c(2,7)),
                   na.strings = "?")
data <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

png(file="plot2.png")
plot(data$Time, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()