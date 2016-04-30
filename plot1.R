#!/usr/bin/Rscript
# Plot 1 of Assignment: Course Project 1 of Exploratory Data Analysis#


# set working folder
pth <- "D:/Dropbox/E-books/_Coursera/4_Exploratory_Data_Analysis/Week_1/"

# load all the data
data_raw <- read.csv(paste0(pth, "/household_power_consumption.txt"), sep=";", stringsAsFactors=FALSE)

# subset data between 2007-02-01 and 2007-02-02
data_sub <- subset(data_raw, Date %in% c("1/2/2007", "2/2/2007"), drop = TRUE) 


# open png device
png(paste0(pth, "plot1.png"), width=480, height=480, units = "px")
	#  create the plot with red color (code=2) and specify title, x and y labels
	hist(as.numeric(data_sub$Global_active_power),
		 col=2,
		 main = "Global Active Power",
		 xlab = "Global Active Power (killowatts)",
		 ylab = "Frequency")
dev.off()