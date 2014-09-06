data<-read.table("~/Desktop/HW/household_power_consumption.txt", header=TRUE, sep=";")

data$Date<-strptime(data$Date, format="%d/%m/%Y")
data$Date<-as.Date(data$Date)

dat1<-subset(data, data$Date == "2007-02-01")
dat2<-subset(data, data$Date == "2007-02-02")
dat<-rbind(dat1,dat2)

dat$Sub_metering_1<-as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2<-as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3<-as.numeric(as.character(dat$Sub_metering_3))

n<-nrow(dat)
h<-n/2
day<-c(1,h,n)

png("plot3.png", width=480, height=480)
plot(dat[,7], type="n", xaxt="n", ylab="Energy sub metering", xlab="")
lines(dat[,7])
lines(dat[,8], col="red")
lines(dat[,9], col="blue")
axis(1, at=day, labels=c("Thu","Fri", "Sat"))
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)
dev.off()