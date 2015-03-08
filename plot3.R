## Author: Francisco Marin
## Exploratory Data Analysis, March 2015

## This function will create Plot3 of the Exploratory Data Analysis Project 1
## This file will be save as plot3.png
plot3 <- function() {
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
	png(filename="plot3.png", width=480, height=480, bg="white")
	## Creating the graph using time to have a correct creation of the line graph. 
	ds$Date <- as.POSIXct(paste(ds$Date, ds$Time))
	## calculate the max of the 3 possible Y axis values
	maxItem <- max(c(max(ds$Sub_metering_1), max(ds$Sub_metering_2), max(ds$Sub_metering_3)))
	## Create a plot with x, y axis
	plot(ds$Global_active_power ~ ds$Date, 
		ylab = "Global Active Power (kilowatts)", xlab = "", main="", type = "n",
		ylim=c(0, maxItem ))
	## Create the lines with colors
	lines(ds$Sub_metering_1 ~ ds$Date)
	lines(ds$Sub_metering_2 ~ ds$Date, col="red")
	lines(ds$Sub_metering_3 ~ ds$Date, col="blue")
	## Create the legend with colors and item names
	legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		col=c("black","red","blue"), lty=1)
	## Close the device
	dev.off()
}