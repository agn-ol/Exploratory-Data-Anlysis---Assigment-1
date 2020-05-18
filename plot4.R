filename = "household_power_consumption.txt"

df <- read.delim(filename, header = TRUE, sep = ";", 
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                 na.strings = "?", nrows = 2075259)
df<-transform(subset(df, Date=="1/2/2007"| Date =="2/2/2007"))
df$Date=format(as.Date(df$Date, format="%d/%m/%Y"),"%Y/%m/%d")

df$datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")


png("plot4.png", width = 480, height = 480)        
par(mfrow = c(2,2))
plot(df$datetime, df$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(df$datetime, df$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(df$datetime, df$Sub_metering_1, xlab = "", ylab ="Energy sub metering", col = "black", type = "l")
lines(df$datetime, df$Sub_metering_2, col = "red")
lines(df$datetime, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n", cex=0.7)
plot(df$datetime, df$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
