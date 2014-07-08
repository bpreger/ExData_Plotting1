require(lubridate)
#read the data in
household<- read.table("household_power_consumption.txt", header=TRUE, sep= ";",na.strings="?",stringsAsFactors= FALSE)
#clean up the table
datetime<- within(household, DateTime <- paste(Date,Time, sep=' '))
household<- datetime[,-c(1:2)]
household<- household[,c(8,1:7)]
#Convert the date and time
household$DateTime <- dmy_hms(household$DateTime)
#Subset
household<- subset(household, DateTime> ymd("2007-02-01") & DateTime < ymd("2007-02-03"))

png('plot1.png')
plot1<- with(household, hist(Global_active_power,col="red",main= "Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()