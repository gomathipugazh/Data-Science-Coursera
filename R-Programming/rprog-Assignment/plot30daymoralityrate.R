outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

ncol(outcome)
[1] 46
> nrow(outcome)
[1] 4706


outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

plot(outcome[,11])

names(outcome)