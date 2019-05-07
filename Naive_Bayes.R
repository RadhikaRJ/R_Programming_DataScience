#Naive Bayes implementation

getwd()
setwd("C:/Users/MyPC/Desktop")
getwd()

#load necessary packages
install.packages("mlbench")
library(e1071)
library(plyr)
library(caret)
library(mlbench)

#load and verify the bank data

bank_loan<-read.csv("Demo 2_ Naive Bayes Classifier.csv")
View(bank_loan)
str(bank_loan)

#Convert Default from int to factor
bank_loan$Default<-sapply(bank_loan$Default,factor)
str(bank_loan)


#Build the model
naive_model<-naiveBayes(Default~.,data=bank_loan)
naive_model

#the model creates conditional probability for each feature separately
#We also have Apriori probablility which indicates teh distribution of our data

#prdict
naive_predict<-predict(naive_model,bank_loan)
naive_predict
table(naive_predict,bank_loan$Default)
# we get a confusion matrix 













