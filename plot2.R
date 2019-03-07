fullfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
file.Date<-as.Date(fullfile$Date, "%d/%m/%Y")
t1<-as.Date("2007/02/01", "%Y/%m/%d")
t2<-as.Date("2007/02/02", "%Y/%m/%d")

file.selected<-fullfile[file.Date %in% t1:t2,]
file.selected$Date<-as.Date(file.selected$Date, "%d/%m/%Y")

par(mar=c(5,4,2,2))

#plot2.png
datetime<-as.POSIXct(paste(file.selected$Date, file.selected$Time), format="%Y-%m-%d %H:%M:%S") #alternative is without format option
datetime<-strptime(paste(file.selected$Date, file.selected$Time), format="%Y-%m-%d %H:%M:%S")

with(file.selected, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()