dat<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dat$Date<- as.character(dat$Date)
dat$Date<- as.Date(dat$Date,format = "%d/%m/%Y")

dat2<- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02",]

par(mar = c(4,4,2,1))

png(file="plot1.png",
    width=480, height=480)

hist(dat2$Global_active_power, 
     main = "Global Active Power",
     col = "red",
     yaxt = 'n',
     ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)"
     
)
axis(side = 2, at=seq(0,1200, 200),labels = seq(0,1200,200), cex.axis= 0.55)
dev.off()
     