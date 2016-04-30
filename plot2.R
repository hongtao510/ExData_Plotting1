#!/usr/bin/Rscript
# Plot 2 of Assignment: Course Project 1 of Exploratory Data Analysis#


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
png(paste0(pth, "plot2.png"), width=480, height=480, units = "px")
	#  create a line plot and specify y label
	plot(data_sub$time2, as.numeric(data_sub$Global_active_power), 
		 type="l",
		 xlab = "",
		 ylab = "Global Active Power (killowatts)"
		 )
dev.off()