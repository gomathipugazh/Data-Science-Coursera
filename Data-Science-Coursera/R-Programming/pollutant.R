pollutantmean <- function(directory,pollutant,id=1:332) {
       
        col1 <- if(pollutant == "sulfate"){
                c("NULL", NA, "NULL", "NULL")
                }else if(pollutant == "nitrate"){
                c("NULL","NULL",NA,"NULL")
                }
        
        ## Construct a list of files names
        files <- sprintf ("%s/%03d.csv",directory,id)
        
        ## Read the pollutant data and unlist to compute the mean
        x <- lapply (files, read.csv,colClasses=col1)
        mean (unlist(x), na.rm = TRUE)
        
       ## apply(x,2,mean,na.rm=TRUE)
        
        

}