## Plotting the total emission for the Baltimore city with type is ON-ROAD
## Reading the emission data file
NEI <- readRDS("summarySCC_PM25.rds")

## Extracting only Baltimore city data with type is ON-ROAD
Balti.cty <- subset(NEI,fips == "24510" & type == "ON-ROAD" )


## Calculating the total emission in the Baltimore city for yearly
Yearly.Emisn.Balti <- with(Balti.cty, tapply(Emissions, year, sum, na.rm = T))

## Creating data frame with year and Total fields
Balti.motor.emisn.df <- data.frame(year =  as.numeric(names(Yearly.Emisn.Balti)), Total = Yearly.Emisn.Balti)

## Open the connection for png file
dev.copy(png,"Plot5.png")

## Plotting the total emission for motor vehicle 
qplot(year,Total, data = Balti.motor.emisn.df, geom = c("point","line"),xlab="Years", ylab="Total emission",main = "Emission for motor vehicle sources in Baltimore city ") 

## Closing the connection 
dev.off()