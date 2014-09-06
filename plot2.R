data<-read.table("~/Desktop/HW/household_power_consumption.txt", header=TRUE, sep=";")

data$Date<-strptime(data$Date, format="%d/%m/%Y")
data$Date<-as.Date(data$Date)

dat1<-subset(data, data$Date == "2007-02-01")
dat2<-subset(data, data$Date == "2007-02-02")
dat<-rbind(dat1,dat2)

dat$Global_active_power<-as.numeric(as.character(dat$Global_active_power))

n<-nrow(dat)
h<-n/2
day<-c(1,h,n)

png("plot2.png", width=480, height=480)
plot(dat[,3], type="n", xaxt="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(dat[,3])
axis(1, at=day, labels=c("Thu","Fri", "Sat"))
dev.off()