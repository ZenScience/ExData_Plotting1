power <- read.csv("household_power_consumption.txt",sep=";",header=TRUE,na.strings='?')
power <- transform(power, Date = as.Date(Date, format="%d/%m/%Y"))
power <- subset(power, Date %in% as.Date(c('2007-02-01', '2007-02-02')))
datetime <- paste(power$Date, power$Time)
power$datetime <- as.POSIXct(datetime)
par(mfrow = c(2,2))
with(power, plot(Global_active_power~datetime, ylab="Global Active Power", type="l", xlab=""))
with(power, plot(Voltage~datetime, ylab="Voltage", type="l"))
with(power, {
  plot(Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime, col="red")
  lines(Sub_metering_3~datetime, col="blue")
  legend("topright", lty=1, bty="n", cex=0.5, col = c("black", "blue","red"), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
})
with(power, plot(Global_reactive_power~datetime, type="l", yaxt="n"))
axis(2, at = seq(0, 0.5, by = 0.1))
dev.copy(png, file ="plot4.png", height=480, width=480) 
dev.off()
