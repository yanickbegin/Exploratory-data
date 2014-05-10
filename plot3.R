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
DF2<-data.frame(Date = strptime(paste(EPC_DF.sub$Date, EPC_DF.sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Sub_metering_1=as.numeric(EPC_DF.sub$Sub_metering_1), Sub_metering_2=as.numeric(EPC_DF.sub$Sub_metering_2), Sub_metering_3=as.numeric(EPC_DF.sub$Sub_metering_3), stringAsFactors = FALSE)

## Determine y axis range, plot graph and annotate it
yrange<-range(c(DF2$Sub_metering_1,DF2$Sub_metering_2,DF2$Sub_metering_3))
plot(x = DF2$Date, y = DF2$Sub_metering_1, type = "l", ylim = yrange, xlab = "", ylab = "Energy sub metering")
lines(x =DF2$Date, y = DF2$Sub_metering_2, col = "red")
lines(x=DF2$Date, y = DF2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))

##  Create png file that looks exactly like what's on the screen
png("./plot3.png")
plot(x = DF2$Date, y = DF2$Sub_metering_1, type = "l", ylim = yrange, xlab = "", ylab = "Energy sub metering")
lines(x =DF2$Date, y = DF2$Sub_metering_2, col = "red")
lines(x=DF2$Date, y = DF2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))

dev.off()