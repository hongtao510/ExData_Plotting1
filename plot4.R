#!/usr/bin/Rscript
# Plot 3 of Assignment: Course Project 1 of Exploratory Data Analysis#


# set working folder
pth <- "D:/Dropbox/E-books/_Coursera/4_Exploratory_Data_Analysis/Week_1/"

# load all the data
data_raw <- read.csv(paste0(pth, "/household_power_consumption.txt"), sep=";", stringsAsFactors=FALSE)

# subset data between 2007-02-01 and 2007-02-02
data_sub <- subset(data_raw, Date %in% c("1/2/2007", "2/2/2007"), drop = TRUE) 

# create a new variable combining date and time
data_sub$time2 <- as.POSIXct(paste(data_sub$Date, data_sub$Time), 
	                         format="%d/%m/%Y %H:%M:%S")


# open png device
png(paste0(pth, "plot4.png"), width=480, height=480, units = "px")
	par(mfrow=c(2,2))

	# plot (1,1) Global Active Power over time
	plot(data_sub$time2, as.numeric(data_sub$Global_active_power), 
		 type="l",
		 xlab = "",
		 ylab = "Global Active Power (killowatts)"
		 )

	# plot (1,2) Voltage over time
	plot(data_sub$time2, as.numeric(data_sub$Voltage), 
		 type="l",
		 xlab = "datetime",
		 ylab = "Voltage"
		 )

	# plot (2,1) Sub_meterings 1, 2, and 3 over time
	plot(data_sub$time2, as.numeric(data_sub$Sub_metering_1), 
		 type="n", 
		 xlab = "", 
		 ylab = "Energy sub metering")
	lines(data_sub$time2, as.numeric(data_sub$Sub_metering_1), col=1)
	lines(data_sub$time2, as.numeric(data_sub$Sub_metering_2), col=2)
	lines(data_sub$time2, as.numeric(data_sub$Sub_metering_3), col=4)
	# add a legend without border
	legend("topright", 
		   lty = 1, 
		   col = c(1, 2, 4), 
		   legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		   bty = "n")

	# plot (2,2) Global_reactive_power over time
	plot(data_sub$time2, as.numeric(data_sub$Global_reactive_power), 
		 type="l",
		 xlab = "datetime",
		 ylab = "Voltage",
		 )

dev.off()