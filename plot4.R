data<-read.table("~/Desktop/HW/household_power_consumption.txt", header=TRUE, sep=";")

data$Date<-strptime(data$Date, format="%d/%m/%Y")
data$Date<-as.Date(data$Date)

dat1<-subset(data, data$Date == "2007-02-01")
dat2<-subset(data, data$Date == "2007-02-02")
dat<-rbind(dat1,dat2)

dat$Global_active_power<-as.numeric(as.character(dat$Global_active_power))
dat$Sub_metering_1<-as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2<-as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3<-as.numeric(as.character(dat$Sub_metering_3))
dat$Voltage<-as.numeric(as.character(dat$Voltage))
dat$Global_reactive_power<-as.numeric(as.character(dat$Global_reactive_power))
n<-nrow(dat)
h<-n/2
day<-c(1,h,n)
datetime<-as.POSIXct(paste(dat$Date, dat$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(dat[,3], type="n", xaxt="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(dat[,3])
axis(1, at=day, labels=c("Thu","Fri", "Sat"))

plot(datetime, dat[,5], type="n", ylab="Voltage")
lines(datetime, dat[,5])
axis(1, at=day, labels=c("Thu","Fri", "Sat"))

plot(dat[,7], type="n", xaxt="n", ylab="Energy sub metering", xlab="")
lines(dat[,7])
lines(dat[,8], col="red")
lines(dat[,9], col="blue")
axis(1, at=day, labels=c("Thu","Fri", "Sat"))
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)

plot(datetime, dat[,4], type="n", ylab="Global_reactive_power")
lines(datetime, dat[,4])
axis(1, at=day, labels=c("Thu","Fri", "Sat"))

dev.off()