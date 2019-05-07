#Support Vector Machine 

setwd("C:/Users/MyPC/Desktop")
getwd()

customer_churn <- read.csv("Demo 1_ Support Vector Machines.csv")
str(customer_churn)

View(customer_churn)
count(customer_churn$Churn)
#483 records are churned "1"; 2850 records are not churned "0"

str(customer_churn)

install.packages("plyr")
library(plyr)
customer_churn$Churn<-sapply(customer_churn$Churn,factor)
str(customer_churn)


#split the data
sample_split<-floor(.7*nrow(customer_churn))
set.seed(1)
training<-sample(seq_len(nrow(customer_churn)),size=sample_split)
churn_train<-customer_churn[training,]
churn_test<-customer_churn[-training,]

#Support Vector Machine
install.packages("e1071")
library(e1071)
svm_churn <- svm(formula = Churn ~ .,data=churn_train)
install.packages("caret")
library(caret)
confusionMatrix(churn_train$Churn,predict(svm_churn),positive="1")




Prediction<-predict(svm_churn,churn_test[-1])
prediction_result<-table(pred=Prediction,true=churn_test[,1])
prediction_result


#Output From console
# > setwd("C:/Users/MyPC/Desktop")
# > getwd()
# [1] "C:/Users/MyPC/Desktop"
# > customer_churn <- read.csv("Demo 1_ Support Vector Machines.csv")
# > str(customer_churn)
# 'data.frame':	3333 obs. of  10 variables:
#   $ Churn          : int  0 0 0 0 0 0 0 0 0 0 ...
# $ AccountWeeks   : int  128 107 137 84 75 118 121 147 117 141 ...
# $ ContractRenewal: int  1 1 1 0 0 0 1 0 1 0 ...
# $ DataPlan       : int  1 1 0 0 0 0 1 0 0 1 ...
# $ DataUsage      : num  2.7 3.7 0 0 0 0 2.03 0 0.19 3.02 ...
# $ CustServCalls  : int  1 1 0 2 3 0 3 0 1 0 ...
# $ DayMins        : num  265 162 243 299 167 ...
# $ DayCalls       : int  110 123 114 71 113 98 88 79 97 84 ...
# $ MonthlyCharge  : num  89 82 52 57 41 57 87.3 36 63.9 93.2 ...
# $ RoamMins       : num  10 13.7 12.2 6.6 10.1 6.3 7.5 7.1 8.7 11.2 ...
# > View(customer_churn)
# > count(customer_churn$Churn)
# x freq
# 1 0 2850
# 2 1  483
# > str(customer_churn)
# 'data.frame':	3333 obs. of  10 variables:
#   $ Churn          : int  0 0 0 0 0 0 0 0 0 0 ...
# $ AccountWeeks   : int  128 107 137 84 75 118 121 147 117 141 ...
# $ ContractRenewal: int  1 1 1 0 0 0 1 0 1 0 ...
# $ DataPlan       : int  1 1 0 0 0 0 1 0 0 1 ...
# $ DataUsage      : num  2.7 3.7 0 0 0 0 2.03 0 0.19 3.02 ...
# $ CustServCalls  : int  1 1 0 2 3 0 3 0 1 0 ...
# $ DayMins        : num  265 162 243 299 167 ...
# $ DayCalls       : int  110 123 114 71 113 98 88 79 97 84 ...
# $ MonthlyCharge  : num  89 82 52 57 41 57 87.3 36 63.9 93.2 ...
# $ RoamMins       : num  10 13.7 12.2 6.6 10.1 6.3 7.5 7.1 8.7 11.2 ...
# > library(plyr)
# > customer_churn$Churn<-sapply(customer_churn$Churn,factor)
# > str(customer_churn)
# 'data.frame':	3333 obs. of  10 variables:
#   $ Churn          : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 1 1 1 ...
# $ AccountWeeks   : int  128 107 137 84 75 118 121 147 117 141 ...
# $ ContractRenewal: int  1 1 1 0 0 0 1 0 1 0 ...
# $ DataPlan       : int  1 1 0 0 0 0 1 0 0 1 ...
# $ DataUsage      : num  2.7 3.7 0 0 0 0 2.03 0 0.19 3.02 ...
# $ CustServCalls  : int  1 1 0 2 3 0 3 0 1 0 ...
# $ DayMins        : num  265 162 243 299 167 ...
# $ DayCalls       : int  110 123 114 71 113 98 88 79 97 84 ...
# $ MonthlyCharge  : num  89 82 52 57 41 57 87.3 36 63.9 93.2 ...
# $ RoamMins       : num  10 13.7 12.2 6.6 10.1 6.3 7.5 7.1 8.7 11.2 ...
# > sample_split<-floor(.7*nrow(customer_churn))
# > set.seed(1)
# > training<-sample(seq_len(nrow(customer_churn)),size=sample_split)
# > churn_train<-customer_churn[training,]
# > churn_test<-customer_churn[-training,]
# > library(e1071)
# > svm_churn <- svm(formula = Churn ~ .,data=churn_train)
# > library(caret)
# > confusionMatrix(churn_train$Churn,predict(svm_churn),positive="1")
# Confusion Matrix and Statistics
# 
# Reference
# Prediction    0    1
# 0 1966   21
# 1  169  177
# 
# Accuracy : 0.9186          
# 95% CI : (0.9067, 0.9293)
# No Information Rate : 0.9151          
# P-Value [Acc > NIR] : 0.2911          
# 
# Kappa : 0.6085          
# 
# Mcnemar's Test P-Value : <2e-16          
#                                           
#             Sensitivity : 0.89394         
#             Specificity : 0.92084         
#          Pos Pred Value : 0.51156         
#          Neg Pred Value : 0.98943         
#              Prevalence : 0.08487         
#          Detection Rate : 0.07587         
#    Detection Prevalence : 0.14831         
#       Balanced Accuracy : 0.90739         
#                                           
#        'Positive' Class : 1               
#                                           
# > Prediction<-predict(svm_churn,churn_test[-1])
# > prediction_result<-table(pred=Prediction,true=churn_test[,1])
# > prediction_result
#     true
# pred   0   1
#    0 854  74
#    1   9  63
# > 