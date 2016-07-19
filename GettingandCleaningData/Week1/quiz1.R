### 1 Question

## How many housing units in this survey were worth more than $1,000,000?

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./DATA_DICTIONARY1.csv")

Data1 <- read.csv("./DATA_DICTIONARY1.csv")

Val <- Data1$VAL[!is.na(Data1$VAL) & Data1$VAL == 24 ]
length(Val)

##  53

### 2 Question
Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate?

Tidy data has one variable per column.

### 3 Question
## Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
        
##        dat

##What is the value of:
        
##        sum(dat\(Zip*dat\)Ext,na.rm=T)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, destfile = "Natural-gas-acqu.xlsx")

install.packages("xlsx")
library(xlsx)

row1 <- 18:23
col1 <- 7:15
dat<- read.xlsx2(file="Natural-gas-acqu.xlsx",sheetIndex = 1 ,colIndex = col1,rowIndex = row1,startRow = 18,endRow = 23,header = TRUE)

dat <- read.xlsx("Natural-gas-acqu.xlsx",sheetName = "Sheet1")

##  36534720

### 4 Question

## How many restaurants have zipcode 21231?

install.packages("XML")
library(XML)
fileURLXML <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileURLXML, destfile=tf <- tempfile(fileext=".xml"))

doc <- xmlTreeParse(tf,useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)
length(zipcode[zipcode==21231])

##127


### 5 Question

## Which of the following is the fastest way to calculate the average value of the variable pwgtp15 broken down by sex using the data.table package?

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile = "./DATA_DICT1.csv")
library(data.table)
DT <- fread(input="./DATA_DICT1.csv", sep=",")

DT$SEX


system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(mean(DT$pwgtp15,by=DT$SEX))

system.time(DT[,mean(pwgtp15),by=SEX])

system.time(mean(DT[DT$SEX==1,]$pwgtp15))+system.time(mean(DT[DT$SEX==2,]$pwgtp15))

system.time(rowMeans(DT)[DT$SEX==1])+system.time(rowMeans(DT)[DT$SEX==2])