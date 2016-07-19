## This function is to calculate the lower 30days morality rate in state wise.

best <- function(state,outcome) {
        
        # This function is used to check the Valid state and Outcome.
        if(!any(state == state.abb) ) stop("invalid State")
        else if(!any(outcome == c("heart attack" ,"heart failure","pneumonia")))  stop("invalid Outcome")
        
        #Reads the csv file into dataframe and Creating the subset for the given state.
        Data <- read.csv("outcome-of-care-measures.csv")[ ,c("Hospital.Name","State","Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack","Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure","Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
        New_Data<-subset(Data, Data[,2]==state )
        
        
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
        
        #Getting the hospital name for minimum value in the lower 30day outcome column 
        HospitalName <- New_Data[which(outcome_Col == min(outcome_Col, na.rm = TRUE)), 1]
        
        
        #Sorting the Hospital name by alphabhatical
        if (length(HospitalName)>1){
                Sort_HospitalName <-  sort(HospitalName)
                return(Sort_HospitalName[1])
        }
        
        return(as.character(HospitalName))
        
        
        
}







