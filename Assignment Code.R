library(dplyr)
library(tidyr)
setwd("UCI HAR Dataset")
#First import the generic file features:
#this gives 2 columns: an ordering number and the name of 561 measurements
features<-read.table("features.txt",col.names=c("rank_name","measure")) 
features<-as.character(features[,2])
#now we need to replace the special characters- and () by _
features<-gsub("-","_",features)
features<-gsub("\\(\\)","",features)

#next import generic activity labels
activity.labels<-read.table("activity_labels.txt",col.names=c("label","activity"))
activity.name<-function(x){activity.labels[x,2]}

find.data<-function(setname){
    #declare the filenames we are interested in
    X.filename<-paste("X_",setname,".txt",sep="")
    y.filename<-paste("y_",setname,".txt",sep="")
    subjects.filename<-paste("subject_",setname,".txt",sep="")
    
    #go read the files
    setwd(paste0(getwd(),"/",setname))
    subjects<-read.table(subjects.filename,col.names="subject")
    X.file<-read.table(X.filename,col.names=features)
    activities<-read.table(y.filename,col.names="activity")
    #we really want activities to have clear names
    activities<-mutate(activities,activity=activity.name(activity))
    #now make the sets pretty by adding subject names and activity to the measurements
    data<-bind_cols(subjects,activities)
    data<-bind_cols(data,X.file)
    data<-data%>%
        gather(measurement,value,3:563)
    data<-data%>%
        separate(measurement,into=c("kind","moment","dimension"),sep="_")
    #go back to original working directory and send output
    setwd('..')
    data
}

#get all the data and merge them by rows
data.test<-find.data("test")
data.train<-find.data("train")
data<-bind_rows(data.test,data.train)

#now select only the data we are interested in: the means and the std deviations
data<-data%>%
    filter(moment=="mean"|moment=="std")

#next, summarize the data by subject and activity for each variable.
data2<-data%>%
    group_by(subject,activity,kind,moment,dimension)%>%
    summarize(average=mean(value))
