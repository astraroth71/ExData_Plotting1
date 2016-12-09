# plot1.R
# setwd("Coursera/exploratory_data/ExData_Plotting1/")
source("get_data.R")
# load the data
data1 <- "1/2/2007"
data2 <- "2/2/2007"
dt <- getData()
# extract the requested subset
data <- subset(dt, (dt$Date == data1 | dt$Date == data2)) 
# head(q)
# creating Plot1
png("plot1.png", width=480, height= 480)
hist(data$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")
dev.off()
