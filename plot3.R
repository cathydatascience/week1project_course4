fullfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
file.Date<-as.Date(fullfile$Date, "%d/%m/%Y")
t1<-as.Date("2007/02/01", "%Y/%m/%d")
t2<-as.Date("2007/02/02", "%Y/%m/%d")

file.selected<-fullfile[file.Date %in% t1:t2,]
file.selected$Date<-as.Date(file.selected$Date, "%d/%m/%Y")

par(mar=c(5,4,2,2))
#plot3.png
png(file="plot3.png", width=480, height=480) #copying from one device to another cut off part of legend 
with(file.selected, plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black"))
par(new=TRUE)
with(file.selected, plot(datetime, Sub_metering_2, ylim=range(Sub_metering_1), xlab="", ylab="Energy sub metering", type="l", col="red"))
par(new=TRUE)
with(file.selected, plot(datetime, Sub_metering_3, ylim=range(Sub_metering_1), xlab="", ylab="Energy sub metering", type="l", col="blue"))
legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()