## Plot 3 program - make sure "household_power_consumption.txt" is in your working directory
## We load the full Data here, big file so it  may take some time
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## change the dtat type of the Date column to Date format as needed 
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## ## Subsetting the dataset for the date range of interest to us
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates to the format needed
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


## Plot 3 using the plot function adding 2 addition lines using the line function for the Sub_meters 
## and overlaying it on the map drawn. 
with(data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})

## Adding the Legends on the top right
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file as png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()