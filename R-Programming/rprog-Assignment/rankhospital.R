rankhospital <- function(state, outcome, num) {
        # This function is used to check the Valid state and Outcome.
        if(!any(state == state.abb) ) stop("invalid State")
        else if(!any(outcome == c("heart attack" ,"heart failure","pneumonia")))  stop("invalid Outcome")
        
        #Reads the csv file into dataframe and Creating the subset for the given state.
        Data <- read.csv("outcome-of-care-measures.csv")[ ,c("Hospital.Name","State","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
        New_Data<-subset(Data, Data[,2]==state )
        
        #str(New_Data)
        
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
        
        
        # Ordering the 30 day morality rate
        SData <- New_Data[order(outcome_Col,New_Data[,1], na.last = NA ),]
        
        #Getting index related to outcome.
       num <- if(num == "best") 1
              else if (num == "worst") nrow(SData)
              else if (is.numeric(num))num
        return(as.character(SData[num,1]))
        
        
}
      
