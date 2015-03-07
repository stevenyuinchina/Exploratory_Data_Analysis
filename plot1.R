# 1. Read data
setwd("C:/Users/steven-j.yu/Downloads/Steven's/Ñ§Ï°×ÊÁÏ/Data Science - 04 Exploratory data analysis/Course Project 1")
household_power_consumption<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")

# 2. Type change and filter
household_power_consumption$Date<-as.Date(household_power_consumption$Date,format="%d/%m/%Y")
household_power_consumption_filtered<-household_power_consumption[household_power_consumption$Date=="2007-02-01"| household_power_consumption$Date=="2007-02-02",]

# 3. Make hist
png(filename="plot1.png",width = 480, height = 480, units = "px",)
hist(household_power_consumption_filtered$Global_active_power, col = "red", plot=TRUE, main = "Global Active Power",ylim=c(0,1200),xlab="Global Active Power (kilowatts)")
dev.off()