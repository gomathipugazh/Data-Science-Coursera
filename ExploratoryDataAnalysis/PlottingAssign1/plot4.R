## Reading Power Consumption Data into the Table
power_consp_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Reading two day data on Feb month
twoday_power_consp_data <- power_consp_data[power_consp_data$Date %in% c("1/2/2007","2/2/2007") ,]

##Converting Character date into Date format
date_time <- strptime(paste(twoday_power_consp_data$Date, twoday_power_consp_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Extracting Global Active Power Data, Sub Metering1 Data, Sub Metering2 Data, Sub Metering3 Data,
##Global Reactive power and Voltage
global_actv_pwr <- as.numeric(twoday_power_consp_data$Global_active_power)
sub_metering1 <- as.numeric(twoday_power_consp_data$Sub_metering_1)
sub_metering2 <- as.numeric(twoday_power_consp_data$Sub_metering_2)
sub_metering3 <- as.numeric(twoday_power_consp_data$Sub_metering_3)
global_ractv_pwr <- as.numeric(twoday_power_consp_data$Global_reactive_power)
voltage <- as.numeric(twoday_power_consp_data$Voltage)

##Creating png file 
png("plot4.png", width=480, height=480)

##Passing two column and 2 row Parameter for the plot. 
par(mfrow = c(2, 2)) 

##Plotting the Date and Global Active Data in the plot
plot(date_time, global_actv_pwr, type="l", xlab="", ylab="Global Active Power", cex=0.2)

##Plotting the Date and Voltage Data in the plot
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

##Plotting the Date and Sub Metering 1 Data in the plot
plot(date_time, sub_metering1, type="l", ylab="Energy Submetering", xlab="")

##Using Annotation function lines to add two(Sub Metering2 and Sub Metering3) more datas in the plot. 
lines(date_time, sub_metering2, type="l", col="red")
lines(date_time, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

##Plotting the Date and Global Reactive Data in the plot
plot(date_time, global_ractv_pwr, type="l", xlab="datetime", ylab="Global_reactive_power")

##Trun off the device
dev.off()