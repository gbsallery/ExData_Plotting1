dat <- read.table("household_power_consumption.txt", sep=";", header=T)

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
d <- dat[dat$Date == as.Date("2007-02-01") | dat$Date == as.Date("2007-02-02"),]
d$Global_active_power <- as.numeric(d$Global_active_power)
d$dt <- as.POSIXct(paste(d$Date, " ", d$Time))

png(filename = "plot2.png")
plot(d$dt, d$Global_active_power/1000, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()