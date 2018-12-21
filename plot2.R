dat<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat$Date<- as.character(dat$Date)
dat$Date<- as.Date(dat$Date,format = "%d/%m/%Y")

dat2<- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02",]
dat2day<- data.frame(weekdays(dat2$Date))

dat3<- cbind(dat2day,dat2)

dat3daytime<- data.frame(as.POSIXct(paste(dat3$Date, dat3$Time), format="%Y-%m-%d %H:%M:%S"))

dat3<- cbind(dat3daytime,dat3)

par(mar = c(4,4,2,4))

png(file="plot2.png",
    width=480, height=480)

########################

plot(dat3$as.POSIXct.paste.dat3.Date..dat3.Time...format.....Y..m..d..H..M..S..,
     dat3$Global_active_power,
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

#########################


dev.off()
