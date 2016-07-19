rankall <- function(outcome, num="best") {
        
        #Reads the csv file into dataframe and Creating the subset for the given state.
        New_Data <- read.csv("outcome-of-care-measures.csv")[ ,c("Hospital.Name","State","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
        
        
        # Getting the required column for related outcome.
        if (outcome == "heart attack"  )
        {
                outcome_Col<-suppressWarnings(as.numeric(as.character(New_Data[,3])))
                
        }   
        else if(outcome == "heart failure" )
        {  
                
                outcome_Col<-suppressWarnings(as.numeric(as.character(New_Data[,4])))
        }
        else if(outcome == "pneumonia")
        {
                outcome_Col<-suppressWarnings(as.numeric(as.character(New_Data[,5])))
        }
        
        # Ordering the 30 day morality rate in state-wise
        SData <- New_Data[order(New_Data[,2],outcome_Col,New_Data[,1],na.last = NA  ),]
        
        #Finding the First and last index of record in each state
        FirstValue <- which((!duplicated(SData[,2])))
        LastValue <-  which(!duplicated(SData[,2],fromLast=TRUE))
        
        #Getting no.of.records in each state.
        SplitData<- aggregate(SData,list(SData$State),length)
        CountSplit<-SplitData[,2]
        
        #Getting index related to outcome.
        if(num == "best") Fnum <- FirstValue 
        else if (num == "worst") Fnum <- LastValue
        else if (is.numeric(num))
        {
                #Checking the num ranking in data. If num ranking does not exist then returning NA to that index.
                Fnum <- NULL
                for(i in 1:length(FirstValue)){
                        
                        if(num > CountSplit[i] ){
                                Fnum[i] = NA
                         }
                        else if(num < CountSplit[i]){
                                Fnum[i]=(FirstValue[i] + (num -1))
                        }
                }
        }
        colnames(SData) <- c('hospital','state')
        
        return(SData[Fnum,1:2])
        
        
}

#r <- rankall("heart failure", 10)
#as.character(subset(r, state == "NV")$hospital)





