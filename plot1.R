## Plot 1 program - make sure "household_power_consumption.txt" is in your working directory
## We load the full Data here, big file so it  may take some time
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## change the dtat type of the Date column to Date format as needed 
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the dataset for the date range of interest to us
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates to the format needed
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1 using Hist function
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file as a png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()