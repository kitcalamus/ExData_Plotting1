dat<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat$Date<- as.character(dat$Date)
dat$Date<- as.Date(dat$Date,format = "%d/%m/%Y")

dat2<- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02",]
dat2day<- data.frame(weekdays(dat2$Date))

dat3<- cbind(dat2day,dat2)

dat3daytime<- data.frame(as.POSIXct(paste(dat3$Date, dat3$Time), format="%Y-%m-%d %H:%M:%S"))

dat3<- cbind(dat3daytime,dat3)

png(file="plot4.png",
    width=480, height=480)
par(mar = c(2,2,1,2))
par(mfrow = c(2,2))

##plot 1


plot(dat3$as.POSIXct.paste.dat3.Date..dat3.Time...format.....Y..m..d..H..M..S..,
     dat3$Global_active_power,
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

##plot 2

plot(dat3$as.POSIXct.paste.dat3.Date..dat3.Time...format.....Y..m..d..H..M..S..,
     dat3$Voltage,
     type = 'l',
     xlab = "datetime",
     ylab = "Voltage")

##plot 3

plot(dat3$as.POSIXct.paste.dat3.Date..dat3.Time...format.....Y..m..d..H..M..S..,
     dat3$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(dat3$as.POSIXct.paste.dat3.Date..dat3.Time...format.....Y..m..d..H..M..S..,
      dat3$Sub_metering_2, col = "red")

lines(dat3$as.POSIXct.paste.dat3.Date..dat3.Time...format.....Y..m..d..H..M..S..,
      dat3$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), bty = "n", cex = 0.8)

##plot 4 

plot(dat3$as.POSIXct.paste.dat3.Date..dat3.Time...format.....Y..m..d..H..M..S..,
     dat3$Global_reactive_power,
     type = "l",
     yaxt = 'n',
     xlab = "datetime",
     ylab = "Global_reactive_power")

axis(side = 2, at=seq(0,0.5,0.1), labels = seq(0,0.5,0.1), cex.axis= 0.8)

dev.off()