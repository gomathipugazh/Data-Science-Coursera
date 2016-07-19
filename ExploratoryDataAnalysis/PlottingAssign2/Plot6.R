## Plotting the total emission for the Baltimore and Los Angeles city with type is motor vehicle. comparing both to find how they changes.
## Reading the emission data file
NEI <- readRDS("summarySCC_PM25.rds")

## Extracting the Baltimore city data with type is on road
Balti.cty <- subset(NEI,fips =="24510" & type == "ON-ROAD" )
Los.Ange.cty <- subset(NEI,fips =="06037" & type == "ON-ROAD" )

## Calculating the total emission in the Baltimore city for yearly
Yearly.Emisn.Balti <- with(Balti.cty, tapply(Emissions, year, sum, na.rm = T))

## Calculating the total emission in the Los Angeles city for yearly
Yearly.Emisn.Los.Ange <- with(Los.Ange.cty, tapply(Emissions, year, sum, na.rm = T))

## Creating data frame with year and Total fields for Baltimore and Los Angeles cities
Balti.motor.emisn.df <- data.frame(year =  as.numeric(names(Yearly.Emisn.Balti)), Total = Yearly.Emisn.Balti,City = "Baltimore")
Los.Ange.motor.emisn.df <- data.frame(year =  as.numeric(names(Yearly.Emisn.Los.Ange)), Total = Yearly.Emisn.Los.Ange,City = "Los Angeles")

## Binding the two table into one table in row wise 
Both.Cty.df <- rbind(Balti.motor.emisn.df,Los.Ange.motor.emisn.df)

## Open the connection for png file
dev.copy(png,"Plot6.png")

## Plotting the total emission for two cities and comparing  both the graph
qplot(year,Total, data = Both.Cty.df, geom = c("point","line"),xlab="Years", ylab="Total emission",main = "Emission for motor vehicle sources", colour = City) 


## Closing the connection 
dev.off()
