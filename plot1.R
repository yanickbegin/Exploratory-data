##Exploratory data and analysis - Course Project 1

##Download data from given link
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <- "./ElectricPowerConsumption.zip"
download.file(url, destFile, method = "curl")

## Unzip the file and create data frame
unzip(destFile)
EPC_DF <- read.table("./household_power_consumption.txt", header=TRUE, sep = ';', stringsAsFactors = FALSE)
EPC_DF.sub <- subset(EPC_DF, Date == "1/2/2007" | Date == "2/2/2007")

## Create graph and save it to png file
hist(as.numeric(EPC_DF.sub$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "./plot1.png")
dev.off()