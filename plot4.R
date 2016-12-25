## reading the data
files <- "./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
data <- read.table(files, header = TRUE, sep = ";", na.strings = "?")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## Plot 4

## convert data and time to specific format
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

## open device
if(!file.exists("plots")) dir.create("plots")
png(filename = "./plots/plot4.png", width = 480, height = 480, units = "px")

## plot figure
par(mfrow = c(2, 2))

plot(subdata$DateTime, subdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", type = "l")

plot(subdata$DateTime, subdata$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(subdata$DateTime, subdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(subdata$DateTime, subdata$Sub_metering_2, type = "l", col = "red")
lines(subdata$DateTime, subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

plot(subdata$DateTime, subdata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

# close device
dev.off()
