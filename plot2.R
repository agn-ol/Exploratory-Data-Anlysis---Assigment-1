filename = "household_power_consumption.txt"

df <- read.delim(filename, header = TRUE, sep = ";", 
                 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                 na.strings = "?", nrows = 2075259)
df<-transform(subset(df, Date=="1/2/2007"| Date =="2/2/2007"))
df$Date=format(as.Date(df$Date, format="%d/%m/%Y"),"%Y/%m/%d")

df$datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")


png("plot2.png", width = 480, height = 480)        
plot(df$datetime, df$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
