## Question 1:
##Register an application with the Github API here https://github.com/settings/applications. Access the API to get information on your instructors repositories (hint: this is the url you want "https://api.github.com/users/jtleek/repos"). 4
##Use this data to find the time that the datasharing repo was created. What time was it created? This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). 
##You may also need to run the code in the base R package and not R studio.

oauth_endpoints("github")
myapp <- oauth_app("github",
                   key = "db33cfb2121035e4ae53",
                   secret = "d513f0e3748028a0fb7dc9c544410113011efc91")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

## Question 2:
##The sqldf package allows for execution of SQL commands on R data frames. We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL. Download the American Community Survey data and load it into an R object called
##acs
##https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
##Which of the following commands will select only the data for the probability weights that are formatted like pwgtp1, pwgtp2, pwgtp3, etc. for the people with ages less than 50?

acs <- data.table(read.csv("getdata-data-ss06pid.csv",header=T))
query1 <- sqldf("select pwgtp1 from acs where AGEP < 50")
query2 <- sqldf("select pwgtp1 from acs")  ## NO
query3 <- sqldf("select * from acs where AGEP < 50 and pwgtp1")  ## NO
query4 <- sqldf("select * from acs where AGEP < 50")  ## NO
identical(query3, query4)


## Question 4:
##How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
## http://biostat.jhsph.edu/~jleek/contact.html

library(XML)
url = "http://biostat.jhsph.edu/~jleek/contact.html"
html <- htmlTreeParse(url, useInternalNodes = T)
xpathSApply(html,"//title",xmlValue)

codeline <- capture.output(html)

codeh <- readLines(url)

## Question 5:

##Read this data set into R and report the sum of the numbers in the fourth column.

##https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for

##Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for


url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines <- readLines(url, n=10)
w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34", "filler", "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")
d <- read.fwf(url, w, header=FALSE, skip=4, col.names=colNames)
d <- d[, grep("^[^filler]", names(d))]
sum(d[, 4])
















