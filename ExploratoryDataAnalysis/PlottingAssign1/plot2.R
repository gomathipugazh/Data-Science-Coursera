
## Reading Power Consumption Data into the Table
power_consp_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Reading two day data on Feb month
twoday_power_consp_data <- power_consp_data[power_consp_data$Date %in% c("1/2/2007","2/2/2007") ,]

##Converting Character date into Date format
date_time <- strptime(paste(twoday_power_consp_data$Date, twoday_power_consp_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Extracting Global Active Power Data
global_actv_pwr <- as.numeric(twoday_power_consp_data$Global_active_power)

##Creating png file 
png("plot2.png", width=480, height=480)

##Plotting the Date and Global Active Power Data in the plot
plot(date_time, global_actv_pwr, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Trun off the device
dev.off()