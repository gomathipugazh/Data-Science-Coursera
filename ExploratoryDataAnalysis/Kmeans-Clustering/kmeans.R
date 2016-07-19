## 1. Statstic - Try to see the raw data in a understandable pattern.
## 2. Data compression - Compress the data as much as possible to read.


## Kmeans Clustering

set.seed(1234)
par(mar = c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
dataFrame <- data.frame(x, y)
kmeansobj <- kmeans(dataFrame, centers = 3)
names(kmeansobj)

kmeansobj$cluster

## plotting Kmeans

par(mar = rep(0.2, 4))
plot(x, y, col = kmeansobj$cluster, pch = 19, cex = 2)
points(kmeansobj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)


## Heatmap()

set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
kmeansobj2 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1, 2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansobj$cluster)], yaxt = "n")


## Matrix data using Image Function(not real pattern)

set.seed(12345)
par(mar = rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[,nrow(dataMatrix):1])

##Cluster the matrix data(still not real patteren)

par(mar = rep(0.2, 4))
heatmap(dataMatrix)

##Adding pattern
set.seed(678910)
for (i in 1:40){
        ## Flip a coin
        coinflip <- rbinom(1, size = 1, prob = 0.5)
        ## If coin is head add a common pattern to that row
        if(coinflip)
        {
                dataMatrix[i,] <- dataMatrix[i,] + rep(c(0, 3), each = 5)
        }
}


## Plot the data

par(mar = rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[,nrow(dataMatrix):1])

##Cluster the data(Column-wise patterned)

par(mar = rep(0.2, 4))
heatmap(dataMatrix)


##Pattern in rows and columns

hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered), 40:1, , xlab = "Row Mean", ylab = "Row", pch = 19)
plot(colMeans(dataMatrixOrdered), xlab = "Column", ylab = "Column Mean", pch = 19)


## componenrts of the SVD u and v

svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(svd1$u[, 1], 40:1, , xlab = "Row", ylab = "First left singular vector",
     pch = 19)
plot(svd1$v[, 1], xlab = "Column", ylab = "First right singular vector", pch = 19)


##Components of the SVD - varience explained(d)

par(mfrow = c(1, 2))
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Prop. of variance explained",
     pch = 19)

## Relationship to principle components

svd1 <- svd(scale(dataMatrixOrdered))
pca1 <- prcomp(dataMatrixOrdered, scale = TRUE)
plot(pca1$rotation[, 1], svd1$v[, 1], pch = 19, xlab = "Principal Component 1",
     ylab = "Right Singular Vector 1")
abline(c(0, 1))


## Missing Value(Can not calculate SVD)

dataMatrix2 <- dataMatrixOrdered
## Randomly insert some missing data
dataMatrix2[sample(1:100, size = 40, replace = FALSE)] <- NA
svd1 <- svd(scale(dataMatrix2)) ## Doesn't work!

## Replace missing value using impute

source("https://bioconductor.org/biocLite.R")
biocLite("impute")

library(impute) ## Available from http://bioconductor.org
dataMatrix2 <- dataMatrixOrdered
dataMatrix2[sample(1:100,size=40,replace=FALSE)] <- NA
dataMatrix2 <- impute.knn(dataMatrix2)$data
svd1 <- svd(scale(dataMatrixOrdered)); svd2 <- svd(scale(dataMatrix2))
par(mfrow=c(1,2)); plot(svd1$v[,1],pch=19); plot(svd2$v[,1],pch=19)


## Reading face data
library(jpeg)

load("face.rda")
image(t(faceData)[, nrow(faceData):1])

svd1 <- svd(scale(faceData))
plot(svd1$d^2/sum(svd1$d^2), pch = 19, xlab = "Singular Vector", ylab = "Varience explained")

##Note that %*% is matrix multiplication
## Here svd1$d[1] is constant

approx1 <- svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]

##In this example we need to make diagonal matrix out of d

approx5 <- svd1$u[, 1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5])
approx10 <- svd1$u[, 1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[,1:10])

par(mfrow = c(1, 4))
image(t(approx1)[,nrow(approx1):1], main = "(a)")
image(t(approx5)[,nrow(approx5):1], main = "(b)")
image(t(approx10)[,nrow(approx10):1], main = "(c)")
image(t(faceData)[, nrow(faceData):1], main = "(d)") ##Original Data



xy <- matrix(readJPEG("amma.jpg"),nrow = 150,ncol = 150)
image(t(xy)[, nrow(xy):1])
readRDS("amma.Rda")
read.table("amma.Rda")
load("hand.jpg")