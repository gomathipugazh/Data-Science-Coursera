##Two Variable
library(lattice)
xyplot(Ozone ~ Wind, data = airquality)

##Three Variable
library(lattice)
## Convert month to a factor variable
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

##Panel
library(lattice)
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each =50)
y <- x + f - f * x + rnorm(100, sd =0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x |  f, layout = c(2, 1)) ## plot with two panal

##Custom Panel Function
xyplot(y ~ x | f, panel = function(x, y, ...){
        panel.xyplot(x, y, ...)## First call the default function xyplot
        panel.abline(h = median(y), lty = 2) ## Add horizontal line at the median
})


##Custom Panel Function
xyplot(y ~ x | f, panel = function(x,y, ...){
        panel.xyplot(x, y, ...) ##First call the default function xyplot
        panel.lmline(x, y, col = 2) ##Overlay a simple linear regression line
})
}