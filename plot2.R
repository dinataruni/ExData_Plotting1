#Read & Subset
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

power_s <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")
power_s$DateTime <- strptime(paste(power_s$Date, power_s$Time), format = "%Y-%m-%d %H:%M:%S")
power_s<- power_s[,3:10]

#Plot 2
with(power_s, plot(DateTime, Global_active_power, type="lines", ylab = "Global Active Power (kilowatts)", xlab = " "))
dev.copy(png, file = "plot2.png")
dev.off()
