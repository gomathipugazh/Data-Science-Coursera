##Question 1:

## Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. 
## Assign that logical vector to the variable agricultureLogical. 
## Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE. 
## which(agricultureLogical) What are the first 3 values that result?

Readdata <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
names(Readdata)
agricultureLogical <- Readdata$ACR==3 & Readdata$AGS ==6
which(agricultureLogical)

##Question 2:

## Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? 
## (some Linux systems may produce an answer 638 different for the 30th quantile)

install.packages("jpeg", repos = "http://mran.revolutionanalytics.com") 
library(jpeg)
readimg <- readJPEG("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", native = T)

myurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
z <- tempfile()
download.file(myurl,z,mode="wb")
pic <- readJPEG(z,native = T)

quantile(pic,seq(0,1,by=.1))

##-15259150 -1057541

## question 3:

## Match the data based on the country shortcode. 
## How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). 
## What is the 13th country in the resulting data frame?
        
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
sum(!is.na(unique(dt$rankingGDP)))


dt[order(rankingGDP, decreasing = TRUE), list(CountryCode, Long.Name.x, Long.Name.y, rankingGDP, gdp)][13]


## Quiz 4:
        
## What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
        
dt[, mean(rankingGDP, na.rm = TRUE), by = Income.Group]

## Quiz 5:


## Cut the GDP ranking into 5 separate quantile groups. 
## Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?

breaks <- quantile(dt$rankingGDP, probs = seq(0, 1, 0.2), na.rm = TRUE)
dt$quantileGDP <- cut(dt$rankingGDP, breaks = breaks)
dt[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]

