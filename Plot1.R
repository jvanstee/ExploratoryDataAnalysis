library("data.table")

#Reads in data from file then subsets data for specified dates
HouseholdPowerConsumption <- data.table::fread(input = "./ExpData/household_power_consumption.txt"
                             , na.strings="?")

# Convert the Date variables to Date class
HouseholdPowerConsumption[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
HouseholdPowerConsumption <- HouseholdPowerConsumption[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(HouseholdPowerConsumption[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()


