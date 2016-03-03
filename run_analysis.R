
library(reshape2)

# Reading Data

activitylabels<-read.table("activity_labels.txt")
activitylabels[,2]<-as.character(activitylabels[,2])
features<-read.table("features.txt")
features[,2]<-as.character(features[,2])

# Getting wanted features - Mean and Standard Deviation

featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)

# Reading the datasets with required columns

train <- read.table("./train/X_train.txt")[featuresWanted]
trainActivities <- read.table("./train/y_train.txt")
trainSubjects <- read.table("./train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("./test/X_test.txt")[featuresWanted]
testActivities <- read.table("./test/y_test.txt")
testSubjects <- read.table("./test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# Create final data set and rename the columns

final<-rbind(train,test)
colnames(final)<-c("subject","Activity",featuresWanted.names)

# Conversion into factor

final$Activity<-factor(final$Activity,levels = activitylabels[,1],labels = activitylabels[,2])
final$subject<-as.factor(final$subject)

# Melt and Cast for final summary

finalmelt<-melt(final,id.vars = c("subject","Activity"))
finalmean<-dcast(finalmelt,subject+Activity~variable,mean)

write.table(finalmean,"tidy.txt",row.names = FALSE,quote = FALSE)
