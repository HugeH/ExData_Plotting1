##Explorary Data Analysis - Project 1

##All steps required for Plot 1

        ##Setting the file download

        fileurl_zip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

        ##Libraries called
        
        library(downloader)
        library(data.table)

        ##Loading the files
        
        ###Memory check
        
        est_memory_required_mb <- (2075259 * 9 * 8) / 2 ^ 20
        
        
        ###Unzipping the files

        download.file(fileurl_zip,"Dataset.zip", mode="wb")
        unzip("Dataset.zip")
        
        ###Subsetting the data to the correct data range
        
        full_data<-read.csv("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";")
        
        data_subset <- subset(full_data, (Date == "1/2/2007") | (Date == "2/2/2007"))
        
        ##Converting the data formats
        
        ###Converting the dates
        
        data_subset$Date <- as.Date(strptime(as.character(data_subset$Date), "%d/%m/%Y"))
        
        ###Converting variables to numeric format
        
        data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)
        data_subset$Global_reactive_power <- as.numeric(data_subset$Global_reactive_power)
        data_subset$Voltage <- as.numeric(data_subset$Voltage)
        data_subset$Global_intensity <- as.numeric(data_subset$Global_intensity)
        data_subset$Sub_metering_1 <- as.numeric(data_subset$Sub_metering_1)
        data_subset$Sub_metering_2 <- as.numeric(data_subset$Sub_metering_2)
        data_subset$Sub_metering_3 <- as.numeric(data_subset$Sub_metering_3)
        
        
        ##Creating Plot 1
        
        png(filename="plot1.png", width = 480, height = 480, units = "px")
        hist(data_subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off()
        
        