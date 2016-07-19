
## Plotting the emission of coal combusion-realted source in the united states 
## Reading the emission and source classification files
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## Extracting the SCC for Coal combution-related sources
SCC.Coal <- SCC[grepl("Coal",SCC$EI.Sector),]

## Extracting data for related SCC from Source table
NEI.Coal <- NEI[NEI$SCC %in% SCC.Coal$SCC ,]

## Calculating total emission for coal combution in yearly-wise
Tot_Coal <- with(NEI.Coal, tapply(Emissions, year, sum, na.rm = T))

## Creating data frame with year and Total fields
Tot.Coal.df <- data.frame(year =  names(Tot_Coal), Total = Tot_Coal)

## Open the connection for png file
dev.copy(png,"Plot4.png")

## Plotting Coal combution emission data in yearly wise
ggplot(Tot.Coal.df, aes(x=factor(year), y=Total,fill=year)) +
        geom_bar(stat="identity")+ xlab("Year") +ylab("Total emission") +ggtitle("Emission from Coal combusion -realated source")

## Closing the connection 
dev.off()
        



