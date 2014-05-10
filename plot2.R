##Exploratory data and analysis - Course Project 1

##Download data from given link
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <- "./ElectricPowerConsumption.zip"
download.file(url, destFile, method = "curl")

## Unzip the file and create data frame
unzip(destFile)
EPC_DF <- read.table("./household_power_consumption.txt", header=TRUE, sep = ';', stringsAsFactors = FALSE)
EPC_DF.sub <- subset(EPC_DF, Date == "1/2/2007" | Date == "2/2/2007")

##  Create a new data frame with correct format for date and time
DF<-data.frame(Date = strptime(paste(EPC_DF.sub$Date, EPC_DF.sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Global_active_power = as.numeric(EPC_DF.sub$Global_active_power), Day = weekdays(as.Date(EPC_DF.sub$Date, format = "%d/%m/%Y")))
plot(x = DF$Date, y = DF$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")

##  Create png file
dev.copy(png, "./plot2.png")
dev.off()
