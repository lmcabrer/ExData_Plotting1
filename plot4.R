##Initialization of the data set
tableAll <- read.table("household_power_consumption.txt", sep = ";",header =TRUE, na.strings="?", colClasses= c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
tableAll$Date<-as.Date(tableAll$Date, "%d/%m/%Y")
TwoDaysFeb<<- tableAll$Date<as.Date("2007-02-03") & tableAll$Date>as.Date("2007-01-31") 
tableFirstDaysFeb <- tableAll[TwoDaysFeb,]
tableFirstDaysFeb$Time   <- as.POSIXlt(paste(tableFirstDaysFeb$Date, tableFirstDaysFeb$Time, sep=" "))

#Creating the plot file
png(file = "plot4.png")
par(mfcol = c(2, 2))
with(tableFirstDaysFeb, hist(Global_active_power,col = "red", breaks = interval, main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
with(tableFirstDaysFeb, plot(Time,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab=""))
with(tableFirstDaysFeb, plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(tableFirstDaysFeb, points(Time, Sub_metering_1,type="l"))
with(tableFirstDaysFeb, points(Time, Sub_metering_2,type="l",col="red"))
with(tableFirstDaysFeb, points(Time, Sub_metering_3,type="l",col="blue"))
legend("topright", pch = "_", col = c("black",  "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(tableFirstDaysFeb, plot(Time,Voltage, type = "l",  xlab="datetime"))
with(tableFirstDaysFeb, plot(Time, Global_reactive_power, type="l", xlab="datetime", ))
dev.off()

