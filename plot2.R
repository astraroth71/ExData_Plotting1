# plot 2
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
# Creating Plot2:
png("plot2.png", width=480, height= 480)
plot(data$DateTime, data$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()