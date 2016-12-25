## reading the data
files <- "./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
data <- read.table(files, header = TRUE, sep = ";", na.strings = "?")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## Plot 1

## open device
if(!file.exists("plots")) dir.create("plots")
png(filename = "./plots/plot1.png", width = 480, height = 480, units = "px")

## plot figure
with(subdata, hist(Global_active_power, xlab = "Global Active Power (kilowatt)", main = "Global Active Power", col = "red"))

## close device
dev.off()
