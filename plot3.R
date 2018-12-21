dat<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat$Date<- as.character(dat$Date)
dat$Date<- as.Date(dat$Date,format = "%d/%m/%Y")

dat2<- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02",]
dat2day<- data.frame(weekdays(dat2$Date))

dat3<- cbind(dat2day,dat2)

dat3daytime<- data.frame(as.POSIXct(paste(dat3$Date, dat3$Time), format="%Y-%m-%d %H:%M:%S"))

dat3<- cbind(dat3daytime,dat3)

png(file="plot3.png",
    width=480, height=480)

####################################


par(mar = c(2,5,1,5))

plot(dat3$as.POSIXct.paste.dat3.Date..dat3.Time...format.....Y..m..d..H..M..S..,
     dat3$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(dat3$as.POSIXct.paste.dat3.Date..dat3.Time...format.....Y..m..d..H..M..S..,
      dat3$Sub_metering_2, col = "red")

lines(dat3$as.POSIXct.paste.dat3.Date..dat3.Time...format.....Y..m..d..H..M..S..,
      dat3$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), cex = 0.9)

dev.off()