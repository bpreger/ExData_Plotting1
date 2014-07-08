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

#Make the graph
png('plot3.png')
par(mar=c(3.1,4.1,2.1,2.1))
    with(household,plot(x=datetime,y=Sub_metering_1,xlab="",ylab="Energy Sub Metering",type="l",col="black"))
        with(household,lines(x=datetime,y=Sub_metering_2,col="red"))
        with(household,lines(x=datetime,y=Sub_metering_3,col="blue"))
        legend("topright",lwd=1, col= c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()