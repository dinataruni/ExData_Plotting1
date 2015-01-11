#Read & Subset
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

power_s <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")
power_s$DateTime <- strptime(paste(power_s$Date, power_s$Time), format = "%Y-%m-%d %H:%M:%S")
power_s<- power_s[,3:10]

#Plot 4
par(mfrow = c(2,2))
with(power_s, {
  with(power_s, plot(DateTime, Global_active_power, type="n", ylab = "Global Active Power", xlab = " "))
  with(power_s, lines(DateTime, Global_active_power))
  with(power_s, plot(DateTime, Voltage, type="n", xlab="datetime"))
  with(power_s, lines(DateTime, Voltage))
  with(power_s, plot(DateTime, Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering"))
  with(power_s, lines(DateTime, Sub_metering_1))
  with(power_s, lines(DateTime, Sub_metering_2, col="red"))
  with(power_s, lines(DateTime, Sub_metering_3, col="blue"))
  legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  with(power_s, plot(DateTime, Global_reactive_power, type="n", xlab="datetime"))
  with(power_s, lines(DateTime, Global_reactive_power))
}
)
dev.copy(png, file = "plot4.png")
dev.off()