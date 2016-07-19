##Example for ColorRamp for read and blue
pal <- colorRamp(c("red", "blue"))

##Giving values 0 and 1(read and blue) in the palette
pal(0)

##returning numbers for the color
[,1] [,2] [,3]
[1,]  255    0    0

pal(1)

[,1] [,2] [,3]
[1,]    0    0  255

pal(0.5)

[,1] [,2]  [,3]
[1,] 127.5    0 127.5

##Giving sequence of number for both the read and blue in the palette
pal(seq(0, 1, len = 10))

## Giving red and green for the colorRamp 
pal <- colorRamp(c("red", "green"))
pal(0) ##Red
pal(1) ##Green

## Example for colorRampPalette for red and yellow

pal <- colorRampPalette(c("red","yellow"))

pal(2)

##Returns headecimal for colors

"#FF0000" "#FFFF00"

pal(10)

[1] "#FF0000" "#FF1C00" "#FF3800" "#FF5500" "#FF7100" "#FF8D00" "#FFAA00" "#FFC600" "#FFE200"
[10] "#FFFF00"


library(RColorBrewer)
cols <- brewer.pal(3, "BuPu")
cols  ##[1] "#E5F5F9" "#99D8C9" "#2CA25F"
pal <- colorRampPalette(cols)

image(volcano, col = pal(20))

##The Smooth scatter function
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x, y)

##Scatter plot with no transparency
plot(x, y, pch = 19)

##Scatter plot with transparency
plot(x, y, col = rgb(0, 0, 0, 0.2), pch = 19)
