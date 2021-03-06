power <- read.csv("household_power_consumption.txt",sep=";",header=TRUE,na.strings='?')
power <- transform(power, Date = as.Date(Date, format="%d/%m/%Y"))
power <- subset(power, Date %in% as.Date(c('2007-02-01', '2007-02-02')))
datetime <- paste(power$Date, power$Time)
power$Datetime <- as.POSIXct(datetime)
with(power, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
  legend("topright", lty=1, lwd=2, col = c("black", "blue","red"), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
})
dev.copy(png, file ="plot3.png", height=480, width=480) 
dev.off()
