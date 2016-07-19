library(data.table)

## Reading X,Activty and Subject of test data into the tables
test_X <- read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE)
test_Y <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)
test_Subject <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)


## Binding the test data x,Activity and Subject in the column-wise and making into one table data
test_Data <- cbind(test_Subject,test_Y,test_X)


## Reading X,Activty and Subject of train data into the tables
train_X <- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE)
train_Y <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)
train_Subject <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)


## Binding the train data x,Activity and Subject in the column-wise and making into one table data
train_Data <- cbind(train_Subject,train_Y,train_X)


## Binding test and train data in row-wise
complete_Data<- rbind2(test_Data,train_Data)


## Reading feature information into a table
feature_Data <-read.table("UCI HAR Dataset/features.txt", header=FALSE,colClasses =c("NULL",NA))


## Setting the column name from the feature_Data table to complete_Data table
colnames(complete_Data)[1:2] <- c("Subject_no","Activity_id")

## Using loop for setting the column name
i<-as.numeric(3)
for(j in 1:nrow(feature_Data)){
        
        colnames(complete_Data)[i] <- c(as.character(feature_Data[j,]))
        i<- i+1
}



## Extracting the mean and std columns along with Activity_id and Subject_id
pattern <- c("*mean*","*std*","Subject_no","Activity_id")
M_std_Data <- complete_Data[,grepl(paste(pattern,collapse="|"),names(complete_Data))]


## Removing the \\ and () from the column name
names(M_std_Data) <- gsub("+-|\\(\\)","",names(M_std_Data))


## Ordering the data in activity-wise and reading activity_information in to a table.
## Replacing the Activity_id into Activity_label
ord_Act_id <- M_std_Data[order(M_std_Data[,2]),]
activity_Data <-read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("Activity_id", "Activity_label"))
ord_Act_id$Activity_id <-  merge(x=ord_Act_id, y=activity_Data, by="Activity_id")$Activity_label
ord_Subj_no <- ord_Act_id[order(ord_Act_id[,1]),]


## Coverting data frame into data table for calculating average by each activity and each subject
processed.Data <- data.table(ord_Subj_no)
tidy_Data <- processed.Data[, lapply(.SD, mean), by=list(Subject_no,Activity_id)]


## Writing tidy_data into txt file
write.table(tidy_Data, file="tidy_Data.txt", row.names=FALSE, col.names=TRUE, sep="\t", quote=TRUE)





            






