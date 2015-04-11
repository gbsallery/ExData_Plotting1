dat <- read.table("household_power_consumption.txt", sep=";", header=T)

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
d <- dat[dat$Date == as.Date("2007-02-01") | dat$Date == as.Date("2007-02-02"),]
d$Global_active_power <- as.numeric(d$Global_active_power)

png(filename = "plot1.png")
hist(d$Global_active_power/1000, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", breaks=15)
dev.off()