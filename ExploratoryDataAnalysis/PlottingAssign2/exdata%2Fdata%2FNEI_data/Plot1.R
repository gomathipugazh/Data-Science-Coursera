##SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## Calculating the total emission in the United State for yearly
Yearly.Emisn <- with(NEI, tapply(Emissions, year, sum, na.rm = T))

## Creating data frame with year and Total fields
emisn.df <- data.frame(year =  names(Yearly.Emisn), Total = Yearly.Emisn)

## Plotting the Year and Total emission pm2.5
minval <- min(emisn.df$Total)
maxval <- max(emisn.df$Total)
##qplot(year,Total, data = emisn.df, main = "Total PM2.5 Emission in the yearly-wise" , xlab = "Year",ylab = "Total PM2.5 Emission")
plot.new()
par(pch=16, col="blue")
plot(emisn.df$year,emisn.df$Total,main = "Total PM2.5 Emission in the yearly-wise" , xlab = "Year",ylab = "Total PM2.5 Emission",ylim = c(minval,maxval))
lines(emisn.df$year,emisn.df$Total,type = "o")