complete <- function(directory, id=1:332) {

nobs <- function(id) {
        path <- file.path(directory, paste(sprintf("%03d", as.numeric(id)), ".csv", sep=""))
        #return(lapply(path,function(x) sum(complete.cases(read.csv(x)))))
        
        
        return (sum(complete.cases(read.csv(path))))
        
}
return (data.frame(id=id, nobs=sapply(id, nobs)))
}