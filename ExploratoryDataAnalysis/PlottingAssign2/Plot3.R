## Plotting emission for four type of sources in the Baltimore city
## Reading the emission data file
NEI <- readRDS("summarySCC_PM25.rds")

## Extracting only Baltimore city data
Balti.cty <- subset(NEI,fips == "24510" )

##Opening the connection for png file
dev.copy(png, 'Plot3.png')

## Plotting the emmision data by four sources from 1999 to 2008
qplot(year, Emissions, data=Balti.cty, facets=~type,size=I(3) ,xlab="Years", ylab="Emission",main = "Emission for various source in Baltimore Source") +theme(strip.background = element_rect(fill="sky blue"))

## Closing the connection
dev.off()