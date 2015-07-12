##Initialization of the data set
tableAll <- read.table("household_power_consumption.txt", sep = ";",
                       header =TRUE, na.strings="?", 
                       colClasses= c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
tableAll$Date <-as.Date(tableAll$Date, "%d/%m/%Y")
TwoDaysFeb <- tableAll$Date<as.Date("2007-02-03") & tableAll$Date>as.Date("2007-01-31") 
tableFirstDaysFeb <- tableAll[TwoDaysFeb,]
rm(TwoDaysFeb) # not necessary anymore
rm(tableAll) # Removing big table
#Creating the Time variable as a combination of Date and time
tableFirstDaysFeb$Time   <- as.POSIXlt(paste(tableFirstDaysFeb$Date, tableFirstDaysFeb$Time, sep=" "))

#Creating the plot file
png(file = "plot4.png")
par(mfcol = c(2, 2))
#UpLeft drawing
with(tableFirstDaysFeb, plot(Time,Global_active_power, type = "l", 
                             ylab = "Global Active Power", xlab=""))
#DownLeft drawing
with(tableFirstDaysFeb, plot(Time, Sub_metering_1, type="n", xlab="", 
                             ylab="Energy sub metering"))
with(tableFirstDaysFeb, points(Time, Sub_metering_1,type="l"))
with(tableFirstDaysFeb, points(Time, Sub_metering_2,type="l",col="red"))
with(tableFirstDaysFeb, points(Time, Sub_metering_3,type="l",col="blue"))
legend("topright", lty = 1, bty = "n", col = c("black",  "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#UpRigth drawing
with(tableFirstDaysFeb, plot(Time,Voltage, type = "l",  xlab="datetime"))
#DownRight
with(tableFirstDaysFeb, plot(Time, Global_reactive_power, type="l", xlab="datetime" ))
dev.off()
rm(tableFirstDaysFeb)

