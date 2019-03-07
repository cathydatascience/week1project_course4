fullfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
file.Date<-as.Date(fullfile$Date, "%d/%m/%Y")
t1<-as.Date("2007/02/01", "%Y/%m/%d")
t2<-as.Date("2007/02/02", "%Y/%m/%d")

file.selected<-fullfile[file.Date %in% t1:t2,]
file.selected$Date<-as.Date(file.selected$Date, "%d/%m/%Y")

par(mar=c(5,4,2,2))

#plot4.png
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(file.selected, { 
  plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(datetime, Voltage, type="l")
  plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black")
  par(new=TRUE)
  plot(datetime, Sub_metering_2, ylim=range(Sub_metering_1), xlab="", ylab="Energy sub metering", type="l", col="red")
  par(new=TRUE)
  plot(datetime, Sub_metering_3, ylim=range(Sub_metering_1), xlab="", ylab="Energy sub metering", type="l", col="blue")
  legend("topright", lty="solid", bty="n", cex=0.9, col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, Global_reactive_power, type="l")
}) 
dev.off()