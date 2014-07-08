require(lubridate)
#read the data in
household<- read.table("household_power_consumption.txt", header=TRUE, sep= ";",na.strings="?",stringsAsFactors= FALSE)
#clean up the table
datetime<- within(household, datetime <- paste(Date,Time, sep=' '))
household<- datetime[,-c(1:2)]
household<- household[,c(8,1:7)]
#Convert the date and time
household$datetime <- dmy_hms(household$datetime)
#Subset
household<- subset(household, datetime> ymd("2007-02-01") & datetime < ymd("2007-02-03"))

#Drawing
png(file = "plot4.png")
par(mfrow= c(2,2))
#Graph1
with(household,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)", col="black"))
#Graph2
with(household,plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage",lwd=2, col="black"))
#Graph3
with(household,plot(x=datetime,y=Sub_metering_1,xlab="",ylab="Energy Sub Metering",type="l",col="black"))
with(household,lines(x=datetime,y=Sub_metering_2,col="red"))
with(household,lines(x=datetime,y=Sub_metering_3,col="blue"))
legend("topright",col= c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,bty="n")
#Graph4
with(household,plot(datetime,Global_reactive_power,type="l",lwd=1))
dev.off()