# plot 4
source("get_data.R")
# load the data
data1 <- "1/2/2007"
data2 <- "2/2/2007"
dt <- getData()
# extract the requested subset
data <- subset(dt, (dt$Date == data1 | dt$Date == data2))

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# creating a new column DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# plot 4
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2)) # adding plots in col-wised manner.
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") # Adding the first plot.
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) # The end of adding the second plot.
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")   # Adding the third plot.
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  # Adding the forth plot.
dev.off()