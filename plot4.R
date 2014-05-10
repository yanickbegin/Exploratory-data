##Exploratory data and analysis - Course Project 1

##Download data from given link
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <- "./ElectricPowerConsumption.zip"
download.file(url, destFile, method = "curl")

## Unzip the file and create data frame
unzip(destFile)
EPC_DF <- read.table("./household_power_consumption.txt", header=TRUE, sep = ';', stringsAsFactors = FALSE)
EPC_DF.sub <- subset(EPC_DF, Date == "1/2/2007" | Date == "2/2/2007")

## Determine space taken by graphs(2 rows and 2 columns)
par(mfrow = c(2,2))

## First plot
DF<-data.frame(Date = strptime(paste(EPC_DF.sub$Date, EPC_DF.sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Global_active_power = as.numeric(EPC_DF.sub$Global_active_power), Day = weekdays(as.Date(EPC_DF.sub$Date, format = "%d/%m/%Y")))
plot(x = DF$Date, y = DF$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

## Second plot
DF1<-data.frame(datetime = strptime(paste(EPC_DF.sub$Date, EPC_DF.sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Voltage = as.numeric(EPC_DF.sub$Voltage))
plot(x = DF1$datetime, y = DF1$Voltage, type = "l", ylab = "Voltage", xlab ="datetime")

## Third plot
##  Create a new data frame with correct format for date and time
DF2<-data.frame(Date = strptime(paste(EPC_DF.sub$Date, EPC_DF.sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Sub_metering_1=as.numeric(EPC_DF.sub$Sub_metering_1), Sub_metering_2=as.numeric(EPC_DF.sub$Sub_metering_2), Sub_metering_3=as.numeric(EPC_DF.sub$Sub_metering_3), stringAsFactors = FALSE)

## Determine y axis range, plot graph and annotate it
yrange<-range(c(DF2$Sub_metering_1,DF2$Sub_metering_2,DF2$Sub_metering_3))
plot(x = DF2$Date, y = DF2$Sub_metering_1, type = "l", ylim = yrange, xlab = "", ylab = "Energy sub metering")
lines(x =DF2$Date, y = DF2$Sub_metering_2, col = "red")
lines(x=DF2$Date, y = DF2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

## Fourth plot
DF3<-data.frame(datetime = strptime(paste(EPC_DF.sub$Date, EPC_DF.sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Global_reactive_power = as.numeric(EPC_DF.sub$Global_reactive_power))
plot(x = DF3$datetime, y = DF3$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab ="datetime")


##  Create png file that looks exactly like what's on the screen
png("./plot4.png")

## Determine space taken by graphs(2 rows and 2 columns)
par(mfrow = c(2,2))

## First plot
DF<-data.frame(Date = strptime(paste(EPC_DF.sub$Date, EPC_DF.sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Global_active_power = as.numeric(EPC_DF.sub$Global_active_power), Day = weekdays(as.Date(EPC_DF.sub$Date, format = "%d/%m/%Y")))
plot(x = DF$Date, y = DF$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

## Second plot
DF1<-data.frame(datetime = strptime(paste(EPC_DF.sub$Date, EPC_DF.sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Voltage = as.numeric(EPC_DF.sub$Voltage))
plot(x = DF1$datetime, y = DF1$Voltage, type = "l", ylab = "Voltage", xlab ="datetime")

## Third plot
##  Create a new data frame with correct format for date and time
DF2<-data.frame(Date = strptime(paste(EPC_DF.sub$Date, EPC_DF.sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Sub_metering_1=as.numeric(EPC_DF.sub$Sub_metering_1), Sub_metering_2=as.numeric(EPC_DF.sub$Sub_metering_2), Sub_metering_3=as.numeric(EPC_DF.sub$Sub_metering_3), stringAsFactors = FALSE)

## Determine y axis range, plot graph and annotate it
yrange<-range(c(DF2$Sub_metering_1,DF2$Sub_metering_2,DF2$Sub_metering_3))
plot(x = DF2$Date, y = DF2$Sub_metering_1, type = "l", ylim = yrange, xlab = "", ylab = "Energy sub metering")
lines(x =DF2$Date, y = DF2$Sub_metering_2, col = "red")
lines(x=DF2$Date, y = DF2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

## Fourth plot
DF3<-data.frame(datetime = strptime(paste(EPC_DF.sub$Date, EPC_DF.sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Global_reactive_power = as.numeric(EPC_DF.sub$Global_reactive_power))
plot(x = DF3$datetime, y = DF3$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab ="datetime")


dev.off()