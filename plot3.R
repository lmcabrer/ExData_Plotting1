##Initialization of the data set
tableAll <- read.table("household_power_consumption.txt", sep = ";",header =TRUE, na.strings="?", colClasses= c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
tableAll$Date<-as.Date(tableAll$Date, "%d/%m/%Y")
TwoDaysFeb<<- tableAll$Date<as.Date("2007-02-03") & tableAll$Date>as.Date("2007-01-31") 
tableFirstDaysFeb <- tableAll[TwoDaysFeb,]
tableFirstDaysFeb$Time   <- as.POSIXlt(paste(tableFirstDaysFeb$Date, tableFirstDaysFeb$Time, sep=" "))

#Creting the plot file
png(file="plot3.png")
with(tableFirstDaysFeb, plot(Time, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(tableFirstDaysFeb, points(Time, Sub_metering_1,type="l"))
with(tableFirstDaysFeb, points(Time, Sub_metering_2,type="l",col="red"))
with(tableFirstDaysFeb, points(Time, Sub_metering_3,type="l",col="blue"))
legend("topright", pch = "_", col = c("black",  "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()