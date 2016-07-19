corr <- function(directory,threshold=0){
        
        # Get the complete observations from all the files
        ca <- complete(directory)

        # Select the cases with number of observations greater than threshold
        cc <- ca[ca["nobs"]>threshold, ]
        
        corVec <- NULL
        
        for(i in cc$id ){
               
        fullData <- read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
        completeData <- fullData[complete.cases(fullData),]
        corVec <- c(corVec,cor(completeData[2],completeData[3]))     
        }
return(corVec)
       
}