dat <- read.table("household_power_consumption.txt", sep=";", header=T)

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
d <- dat[dat$Date == as.Date("2007-02-01") | dat$Date == as.Date("2007-02-02"),]
d$Global_active_power <- as.numeric(d$Global_active_power)
d$dt <- as.POSIXct(paste(d$Date, " ", d$Time))
d$Sub_metering_1 <- as.numeric(d$Sub_metering_1)
d$Sub_metering_2 <- as.numeric(d$Sub_metering_2)
d$Sub_metering_3 <- as.numeric(d$Sub_metering_3)
d$Voltage <- as.numeric(d$Voltage)
d$Global_reactive_power <- as.numeric(d$Global_reactive_power)

png(filename = "plot4.png")

par(mfrow = c(2,2))

plot(d$dt, d$Global_active_power/1000, type="l", xlab="", ylab="Global Active Power")

plot(d$dt, d$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(d$dt, d$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
points(d$dt, d$Sub_metering_2, type="l", col="red")
points(d$dt, d$Sub_metering_3, type="l", col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), border="none")

plot(d$dt, d$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()