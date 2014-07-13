## Getting full dataset
data_fulldataset <- read.csv("C:/Users/Sergio Navarro/Documents/household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_fulldataset$Date <- as.Date(data_fulldataset$Date, format="%d/%m/%Y")

## Subset data
data <- subset(data_fulldataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_fulldataset)

## Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot one
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


