## This function is used to know the benifits of Lexical scoping.
## This fuction is to Calculates the matrix inverse.If the inverse has already been calculated then it retrieve the inverse from the cache.
## and it reduce the computation process.


## This function is to do the following things
## get the matrix,set the matrix,get the matrix inverse and set the matrix inverse.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmatrix <- function(solve) m <<- solve
        getmatrix <- function() m
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}


## This function is to check if the matrix inverse is calulated or not. 
## if it is already calculated then the value of the matrix inverse is get from cache and skip the calculation
## otherwise it calculate the matrix inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getmatrix()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setmatrix(m)
        m
}

##Sample Output
##> matinv<-makeCacheMatrix(matrix(c(4,2,7,6),2,2))
##> cacheSolve(matinv)
##[,1] [,2]
##[1,]  0.6 -0.7
##[2,] -0.2  0.4