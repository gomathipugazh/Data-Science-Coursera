## Plotting the total emission for the Baltimore city
## Reading the emission data file
NEI <- readRDS("summarySCC_PM25.rds")

## Extracting the Baltimore city data only
Balti.cty <- subset(NEI,fips == "24510" )

## Calculating the total emission in the Baltimore city for yearly
Yearly.Emisn.Balti <- with(Balti.cty, tapply(Emissions, year, sum, na.rm = T))

## Creating data frame with year and Total fields
Balti.emisn.df <- data.frame(year =  as.numeric(names(Yearly.Emisn.Balti)), Total = Yearly.Emisn.Balti)

## Opening the connection for png file
dev.copy(png,"Plot2.png")

## Changing margin parameter
par(mar=c(5,8,4,2))

## Bar Plotting the Year and Total emission pm2.5   , breaks = 12, col = "lightblue", border = "pink"
barplot(Balti.emisn.df$Total,as.matrix(Balti.emisn.df$year), main = "Baltimore City total emission in yearly-wise" ,ylim = c(0,5000), xlab = "Year",ylab = "Total PM2.5 Emission")

##Closing the connection
dev.off()