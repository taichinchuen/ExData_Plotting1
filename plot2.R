## reading the data
files <- "./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
data <- read.table(files, header = TRUE, sep = ";", na.strings = "?")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## Plot 2

## convert data and time to specific format
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

## open device
if(!file.exists("plots")) dir.create("plots")
png(filename = "./plots/plot2.png", width = 480, height = 480, units = "px")

## plot figure
plot(subdata$DateTime, subdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

## close device
dev.off()
