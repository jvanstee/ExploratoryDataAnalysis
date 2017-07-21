library("data.table")

# set working directory
setwd("~/datasciencecoursera")

#Reads in data from file then subsets data for specified dates
HouseholdPowerConsumption <- data.table::fread(input = "./ExpData/household_power_consumption.txt"
                                               , na.strings="?")

# Converting Date and Time to POSIXct format so we can filter and graph by time of day
HouseholdPowerConsumption[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
HouseholdPowerConsumption <- HouseholdPowerConsumption[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

# Plot 3
plot(HouseholdPowerConsumption[, dateTime], HouseholdPowerConsumption[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(HouseholdPowerConsumption[, dateTime], HouseholdPowerConsumption[, Sub_metering_2],col="red")
lines(HouseholdPowerConsumption[, dateTime], HouseholdPowerConsumption[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()