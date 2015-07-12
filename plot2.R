##Initialization of the data set
tableAll <- read.table("household_power_consumption.txt", sep = ";",header =TRUE, 
                       na.strings="?", 
                       colClasses= c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
tableAll$Date<-as.Date(tableAll$Date, "%d/%m/%Y")
TwoDaysFeb <- tableAll$Date<as.Date("2007-02-03") & tableAll$Date>as.Date("2007-01-31") 
tableFirstDaysFeb <- tableAll[TwoDaysFeb,]
rm(TwoDaysFeb) # not necessary anymore
rm(tableAll) # Removing big table
#Creating the Time variable as a combination of Date and time
tableFirstDaysFeb$Time   <- as.POSIXlt(paste(tableFirstDaysFeb$Date, tableFirstDaysFeb$Time, sep=" "))

#Creating the plot file
png(file = "plot2.png")
with(tableFirstDaysFeb, plot(Time,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab=""))
dev.off()
rm(tableFirstDaysFeb)
