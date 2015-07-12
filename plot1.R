##Initialization of the data set
tableAll <- read.table("household_power_consumption.txt", sep = ";",
                       header =TRUE, na.strings="?", 
                       colClasses= c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
tableAll$Date<-as.Date(tableAll$Date, "%d/%m/%Y")
TwoDaysFeb<- tableAll$Date<as.Date("2007-02-03") & tableAll$Date>as.Date("2007-01-31") 
tableFirstDaysFeb <- tableAll[TwoDaysFeb,]
rm(TwoDaysFeb) # not necessary anymore
rm(tableAll) # Removing big table
tableFirstDaysFeb <-tableFirstDaysFeb$Global_active_power #Removing the rest of the unnecessary variables

#creating the plot file
png(file = "plot1.png")
hist(tableFirstDaysFeb,col = "red", main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)")
dev.off()
rm(tableFirstDaysFeb)
