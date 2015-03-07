getPowerConsumptionData <- function() {
    if (!file.exists("./household_power_consumption.txt")) {
        if (!file.exists("./power_consumption.zip")) {
            download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./power_consumption.zip", method="curl")
        }
        unzip("./power_consumption.zip")
    }
    
    power_consumption <<- read.csv("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c(rep("character",2), rep("numeric",7)), na.strings="?")
    power_consumption$Date <<- as.Date(power_consumption$Date, "%d/%m/%Y")
    power_consumption <<- subset(power_consumption, power_consumption$Date >= as.Date("2007-02-01") & power_consumption$Date <= as.Date("2007-02-02"))
    power_consumption$Date <<- paste(power_consumption$Date, power_consumption$Time)
}
