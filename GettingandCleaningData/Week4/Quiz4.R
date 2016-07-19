##Question 1:

## Apply strsplit() to split all the names of the data frame on the characters "wgtp". 
## What is the value of the 123 element of the resulting list?

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./DATA_DICTIONARY1.csv")

Data1 <- read.csv("./DATA_DICTIONARY1.csv")
GG <- strsplit(names(Data1),"wgtp")



##Question 2:

## Load the Gross Domestic Product data for the 190 ranked countries in this data set:
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
## Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?
## Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table


url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url,destfile = "FGDP1.csv" )
dtGDP <- read.csv("FGDP1.csv" , skip = 4)
dtGDP <- dtGDP[dtGDP[,2] != "",]
comm <- as.numeric(gsub(",","",dtGDP[,5]))
mean(comm,na.rm = T)


##Question 3:

## In the data set from Question 2 what is a regular expression that would allow you to count the number of countries whose name begins with "United"? 
## Assume that the variable with the country names in it is named countryNames. 
## How many countries begin with United?
        grep("^United",dtGDP[,4])

##Question 4:
        
## Load the Gross Domestic Product data for the 190 ranked countries in this data set:
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
## Load the educational data from this data set:
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
## Match the data based on the country shortcode. Of the countries for which the end of the fiscal year is available, how many end in June?
## Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table http://data.worldbank.org/data-catalog/ed-stats
        
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
f <- file.path(getwd(), "GDP.csv")
download.file(url, f)
dtGDP <- data.table(read.csv(f, skip = 4, nrows = 215))
dtGDP <- dtGDP[X != ""]
dtGDP <- dtGDP[, list(X, X.1, X.3, X.4)]
setnames(dtGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
                                               "Long.Name", "gdp"))
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
f <- file.path(getwd(), "EDSTATS_Country.csv")
download.file(url, f)
dtEd <- data.table(read.csv(f))
dt <- merge(dtGDP, dtEd, all = TRUE, by = c("CountryCode"))
isFiscalYearEnd <- grepl("fiscal year end", tolower(dt$Special.Notes))
isJune <- grepl("june", tolower(dt$Special.Notes))
table(isFiscalYearEnd, isJune)

##Question 5:

## You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for publicly traded companies on the NASDAQ and NYSE. Use the following code to download data on Amazon's stock price and get the times the data was sampled.
## library(quantmod) amzn = getSymbols("AMZN",auto.assign=FALSE) sampleTimes = index(amzn)
## How many values were collected in 2012? How many values were collected on Mondays in 2012?

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
addmargins(table(year(sampleTimes),weekdays(sampleTimes)))