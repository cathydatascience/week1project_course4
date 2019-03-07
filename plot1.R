fullfile<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
file.Date<-as.Date(fullfile$Date, "%d/%m/%Y")
t1<-as.Date("2007/02/01", "%Y/%m/%d")
t2<-as.Date("2007/02/02", "%Y/%m/%d")

file.selected<-fullfile[file.Date %in% t1:t2,]
file.selected$Date<-as.Date(file.selected$Date, "%d/%m/%Y")

#Error in plot.new() : figure margins too large
par("mar")
par(mar=c(5,4,2,2))

hist(file.selected$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

with(file.selected, hist(Global_active_power, col="red", main= "Global Active Power", xlab="Global Active Power (kilowatts)" ))

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()