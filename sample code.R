#' Make predictions on new data with the activity classification models 
# install and load the following packages:
library(randomForest)
library(RCurl)


#'The "sample data" .RData file contains physical activity accelerometer features during free-living active play sessions

# Load the wrist and hip models and sample data
load(url("https://github.com/QUTcparg/Preschool-ML-vs-CP/blob/main/ML_classifiers.RData?raw=true"))

#Classify activities as SED, Light, or MV (moderate-vigorous)

hip_activity<-as.character(predict(hip_rf,hip_data))
hip_activity[hip_activity%in%c("WALK","RUN")]<-"MV"

wrist_activity<-as.character(predict(wrist_rf,wrist_data))
wrist_activity[wrist_activity%in%c("WALK","RUN")]<-"MV"

