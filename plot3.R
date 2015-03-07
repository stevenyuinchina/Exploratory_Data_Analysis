# 1. Read data
setwd("C:/Users/steven-j.yu/Downloads/Steven's/Ñ§Ï°×ÊÁÏ/Data Science - 04 Exploratory data analysis/Course Project 1")
household_power_consumption<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")

# 2. Type change and filter
household_power_consumption$Date<-as.Date(household_power_consumption$Date,format="%d/%m/%Y")
household_power_consumption_filtered<-household_power_consumption[household_power_consumption$Date=="2007-02-01"| household_power_consumption$Date=="2007-02-02",]
household_power_consumption_filtered$DateAndTime<-as.POSIXct(paste(household_power_consumption_filtered$Date, household_power_consumption_filtered$Time))

# 3. Make plot
png(filename="plot3.png",width = 480, height = 480, units = "px",)
plot(household_power_consumption_filtered$DateAndTime, household_power_consumption_filtered$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(household_power_consumption_filtered$DateAndTime, household_power_consumption_filtered$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(household_power_consumption_filtered$DateAndTime, household_power_consumption_filtered$Sub_metering_2, type="l", col="red")
lines(household_power_consumption_filtered$DateAndTime, household_power_consumption_filtered$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()