library(reshape2)
getData <- function(){
        # File with data
        datafile <- "household_power_consumption.txt"
        # url to zip file with data
        url_data <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        filename <- paste(Sys.Date(), "data.zip", sep = "_")
        # check if exists the datafile
        if(!file.exists(datafile)){
                # if doesn't exists download the zip and extract the file
                if(!file.exists(filename)){
                        download.file(url_data, filename, method = "curl")
                }
                unzip(filename)
        }
        
        # extract the data and create the data.frame
        textdata <- readLines(datafile)
        sub <- grep("^[1|2]/2/2007;*", textdata)
        mydata <- read.table(datafile, sep=";", header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
}
