data<-read.table("~/Desktop/HW/household_power_consumption.txt", header=TRUE, sep=";")

data$Date<-strptime(data$Date, format="%d/%m/%Y")
data$Date<-as.Date(data$Date)

dat1<-subset(data, data$Date == "2007-02-01")
dat2<-subset(data, data$Date == "2007-02-02")
dat<-rbind(dat1,dat2)
#head(dat)
#tail(dat)
dat$Global_active_power<-as.numeric(as.character(dat$Global_active_power))

#default is 480x480 pixles

png("plot1.png", width=480, height=480)
hist(dat[,3], col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()