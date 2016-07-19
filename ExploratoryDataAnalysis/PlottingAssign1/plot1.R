
## Reading Power Consumption Data into the Table
power_consp_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Reading two day data on Feb month
twoday_power_consp_data  <- power_consp_data[power_consp_data$Date %in% c("1/2/2007","2/2/2007") ,]

##Extracting Global Active Power Data
global_actv_pwr<- as.numeric(twoday_power_consp_data$Global_active_power)

##Creating png file 
png("plot1.png", width=480, height=480)

##Creating histrogram for the Global Active Power Data 
hist(global_actv_pwr, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##Trun off the device
dev.off()