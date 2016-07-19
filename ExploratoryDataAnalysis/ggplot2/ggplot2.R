library(ggplot2)
str(mpg)
##Basic qplot
qplot(displ,hwy, data = mpg)

##Adding color aesthetic in basic qplot
qplot(displ, hwy, data = mpg, color = drv)

##Adding geom argument in qplot
qplot(displ, hwy, data = mpg, geom = c("point","smooth") )

##Histrogram in qplot
qplot(hwy,data = mpg, fill = drv)

##panels in qplot
qplot(displ, hwy, data = mpg, facets = .~drv) ## in scattared column-wise
qplot(hwy, data = mpg, facets = drv~., binwidth = 2) ## in histrogram row-wise 


load("maacs.Rda")
head(maacs)
##eno - Exhaled nitric oxide , pm25 - fine particulate matter and _mopos - sensitized to mouse allergen
##histogram without and with color
qplot(log(eno), data = maacs)
qplot(log(eno), data = maacs, fill = mopos)

##geom without and with color
qplot(log(eno), data = maacs,geom = "density")
qplot(log(eno), data = maacs, geom = "density", fill = mopos)

##Scatterplots
qplot(log(pm25),log(eno), data = maacs)
qplot(log(pm25),log(eno), data = maacs, shapes= mopos)
qplot(log(pm25),log(eno), data = maacs, color = mopos)
qplot(log(pm25),log(eno), data = maacs, color = mopos) + geom_smooth(method="lm")
qplot(log(pm25),log(eno), data = maacs, facets = .~mopos, color = mopos) + geom_smooth(method="lm")


