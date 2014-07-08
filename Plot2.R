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

#Draw
png('plot2.png')
with(household,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)", col="black"))
dev.off()