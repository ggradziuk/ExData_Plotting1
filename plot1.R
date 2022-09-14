data <- read.table("household_power_consumption.txt", header=T, sep=";",
                   colClasses = rep(c("character", "numeric"), c(2,7)),
                   na.strings = "?")
data <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

png(file="plot1.png")
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()