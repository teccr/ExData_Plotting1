## Author: Francisco Marin
## Exploratory Data Analysis, March 2015

## This function will create Plot2 of the Exploratory Data Analysis Project 1
## This file will be save as plot2.png
plot2 <- function() {
	##Unzip the data
	unzip("household_power_consumption.zip", list=FALSE)
	## Load the data set with Columns, header, null string and characters to separate the values. 
	ds <- read.csv("household_power_consumption.txt",  
			na.strings = "?", header = TRUE, stringsAsFactors = F, sep = ';', 
			col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
			"Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	## Convert the string date column to a date as suggested in the project definition.
	ds$Date <- as.Date(ds$Date, format = "%d/%m/%Y")
	## Filter the rows by the dates required by the project defition document. 
	ds <- ds[ds$Date >= "2007-02-01" & ds$Date <= "2007-02-02" , ]
	## Create a PNG device to export the graph
	png(filename="plot2.png", width=480, height=480, bg="white")
	## Creating the graph using time to have a correct creation of the line graph. 
	plot(ds$Global_active_power ~ (as.POSIXct(paste(ds$Date, ds$Time))), 
		ylab = "Global Active Power (kilowatts)", xlab = "", main="", type = "l")
	## Close the device
	dev.off()
}