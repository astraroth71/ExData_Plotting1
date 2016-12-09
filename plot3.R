# plot 3
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

# creating plot 3
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()