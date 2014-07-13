## Getting full dataset
data_fulldataset <- read.csv("C:/Users/Sergio Navarro/Documents/household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_fulldataset$Date <- as.Date(data_fulldataset$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_fulldataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_fulldataset)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()