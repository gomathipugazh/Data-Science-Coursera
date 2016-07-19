##Plotting the total emission for united states in the yearly-wise
## Reading the emission data file
NEI <- readRDS("summarySCC_PM25.rds")

## Calculating the total emission in the United State for yearly
Yearly.Emisn <- with(NEI, tapply(Emissions, year, sum, na.rm = T))

## Creating data frame with year and Total fields
emisn.df <- data.frame(year =  names(Yearly.Emisn), Total = Yearly.Emisn)

## Calculating minimum and maximum total emission value for the y axis range
minval <- min(emisn.df$Total)
maxval <- max(emisn.df$Total)

## Opening the connection for png file
dev.copy(png, 'Plot1.png')

##Plotting the Year and Total emission pm2.5
par(pch=16, col="blue")
plot(emisn.df$year,emisn.df$Total,main = "Total PM2.5 Emission in the yearly-wise" , xlab = "Year",ylab = "Total PM2.5 Emission",ylim = c(minval,maxval))
lines(emisn.df$year,emisn.df$Total,type = "o")

##Closing the connection
dev.off()
