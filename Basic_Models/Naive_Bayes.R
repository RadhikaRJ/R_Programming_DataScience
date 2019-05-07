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

#Ouput from Console
# > setwd("C:/Users/MyPC/Desktop")
# > getwd()
# [1] "C:/Users/MyPC/Desktop"
# > library(e1071)
# > library(plyr)
# > library(caret)
# Loading required package: lattice
# Loading required package: ggplot2
# Registered S3 methods overwritten by 'ggplot2':
#   method         from 
# [.quosures     rlang
#   c.quosures     rlang
#   print.quosures rlang
#   > library(mlbench)
#   > bank_loan<-read.csv("Demo 2_ Naive Bayes Classifier.csv")
#   > View(bank_loan)
#   > str(bank_loan)
#   'data.frame':	1000 obs. of  14 variables:
#     $ Default        : int  0 1 0 0 1 0 0 0 0 1 ...
#   $ checkingstatus1: Factor w/ 4 levels "A11","A12","A13",..: 1 2 4 1 1 4 4 2 4 2 ...
#   $ duration       : int  6 48 12 42 24 36 24 36 12 30 ...
#   $ history        : Factor w/ 5 levels "A30","A31","A32",..: 5 3 5 3 4 3 3 3 3 5 ...
#   $ purpose        : Factor w/ 10 levels "A40","A41","A410",..: 5 5 8 4 1 8 4 2 5 1 ...
#   $ amount         : int  1169 5951 2096 7882 4870 9055 2835 6948 3059 5234 ...
#   $ savings        : Factor w/ 5 levels "A61","A62","A63",..: 5 1 1 1 1 5 3 1 4 1 ...
#   $ employ         : Factor w/ 5 levels "A71","A72","A73",..: 5 3 4 4 3 3 5 3 4 1 ...
#   $ installment    : int  4 2 2 2 3 2 3 2 2 4 ...
#   $ residence      : int  4 2 3 4 4 4 4 2 4 2 ...
#   $ age            : int  67 22 49 45 53 35 53 35 61 28 ...
#   $ otherplans     : Factor w/ 3 levels "A141","A142",..: 3 3 3 3 3 3 3 3 3 3 ...
#   $ cards          : int  2 1 1 1 2 1 1 1 1 2 ...
#   $ tele           : Factor w/ 2 levels "A191","A192": 2 1 1 1 1 2 1 2 1 1 ...
#   > bank_loan$Default<-sapply(bank_loan$Default,factor)
#   > str(bank_loan)
#   'data.frame':	1000 obs. of  14 variables:
#     $ Default        : Factor w/ 2 levels "0","1": 1 2 1 1 2 1 1 1 1 2 ...
#   $ checkingstatus1: Factor w/ 4 levels "A11","A12","A13",..: 1 2 4 1 1 4 4 2 4 2 ...
#   $ duration       : int  6 48 12 42 24 36 24 36 12 30 ...
#   $ history        : Factor w/ 5 levels "A30","A31","A32",..: 5 3 5 3 4 3 3 3 3 5 ...
#   $ purpose        : Factor w/ 10 levels "A40","A41","A410",..: 5 5 8 4 1 8 4 2 5 1 ...
#   $ amount         : int  1169 5951 2096 7882 4870 9055 2835 6948 3059 5234 ...
#   $ savings        : Factor w/ 5 levels "A61","A62","A63",..: 5 1 1 1 1 5 3 1 4 1 ...
#   $ employ         : Factor w/ 5 levels "A71","A72","A73",..: 5 3 4 4 3 3 5 3 4 1 ...
#   $ installment    : int  4 2 2 2 3 2 3 2 2 4 ...
#   $ residence      : int  4 2 3 4 4 4 4 2 4 2 ...
#   $ age            : int  67 22 49 45 53 35 53 35 61 28 ...
#   $ otherplans     : Factor w/ 3 levels "A141","A142",..: 3 3 3 3 3 3 3 3 3 3 ...
#   $ cards          : int  2 1 1 1 2 1 1 1 1 2 ...
#   $ tele           : Factor w/ 2 levels "A191","A192": 2 1 1 1 1 2 1 2 1 1 ...
#   > naive_model<-naiveBayes(Default~.,data=bank_loan)
#   > naive_model
#   
#   Naive Bayes Classifier for Discrete Predictors
#   
#   Call:
#     naiveBayes.default(x = X, y = Y, laplace = laplace)
#   
#   A-priori probabilities:
#     Y
#   0   1 
#   0.7 0.3 
#   
#   Conditional probabilities:
#     checkingstatus1
#   Y          A11        A12        A13        A14
#   0 0.19857143 0.23428571 0.07000000 0.49714286
#   1 0.45000000 0.35000000 0.04666667 0.15333333
#   
#   duration
#   Y       [,1]     [,2]
#   0 19.20714 11.07956
#   1 24.86000 13.28264
#   
#   history
#   Y          A30        A31        A32        A33        A34
#   0 0.02142857 0.03000000 0.51571429 0.08571429 0.34714286
#   1 0.08333333 0.09333333 0.56333333 0.09333333 0.16666667
#   
#   purpose
#   Y           A40         A41        A410         A42         A43
#   0 0.207142857 0.122857143 0.010000000 0.175714286 0.311428571
#   1 0.296666667 0.056666667 0.016666667 0.193333333 0.206666667
#   purpose
#   Y           A44         A45         A46         A48         A49
#   0 0.011428571 0.020000000 0.040000000 0.011428571 0.090000000
#   1 0.013333333 0.026666667 0.073333333 0.003333333 0.113333333
#   
#   amount
#   Y       [,1]     [,2]
#   0 2985.457 2401.472
#   1 3938.127 3535.819
#   
#   savings
#   Y          A61        A62        A63        A64        A65
#   0 0.55142857 0.09857143 0.07428571 0.06000000 0.21571429
#   1 0.72333333 0.11333333 0.03666667 0.02000000 0.10666667
#   
#   employ
#   Y          A71        A72        A73        A74        A75
#   0 0.05571429 0.14571429 0.33571429 0.19285714 0.27000000
#   1 0.07666667 0.23333333 0.34666667 0.13000000 0.21333333
#   
#   installment
#   Y       [,1]     [,2]
#   0 2.920000 1.128078
#   1 3.096667 1.088395
#   
#   residence
#   Y       [,1]     [,2]
#   0 2.842857 1.108373
#   1 2.850000 1.094605
#   
#   age
#   Y       [,1]     [,2]
#   0 36.22429 11.38114
#   1 33.96333 11.22238
#   
#   otherplans
#   Y         A141       A142       A143
#   0 0.11714286 0.04000000 0.84285714
#   1 0.19000000 0.06333333 0.74666667
#   
#   cards
#   Y       [,1]      [,2]
#   0 1.424286 0.5847210
#   1 1.366667 0.5597021
#   
#   tele
#   Y        A191      A192
#   0 0.5842857 0.4157143
#   1 0.6233333 0.3766667
#   
#   > naive_predict<-predict(naive_model,bank_loan)
#   > naive_predict
#   [1] 0 1 0 1 1 1 0 1 0 1 1 1 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0
#   [35] 0 1 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1 0 0 1 1 0 0 0 0
#   [69] 0 0 0 0 0 1 0 0 1 0 1 1 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0
#   [103] 0 0 0 1 0 0 1 0 0 0 1 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 1 0
#   [137] 0 0 0 0 0 1 0 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0
#   [171] 1 0 0 0 1 0 0 0 0 0 1 1 1 0 0 0 0 0 0 1 0 1 0 0 1 0 0 0 0 0 0 1 0 0
#   [205] 0 1 0 0 1 0 0 0 1 0 0 0 1 0 1 0 1 0 0 0 0 1 1 1 0 1 0 0 0 0 0 1 1 0
#   [239] 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0
#   [273] 1 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 0 1 0 1 0 0 0 1 0 0 0 0 0 1 0 0 1 0
#   [307] 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0 0 1 0
#   [341] 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 1 0 0 1 1 0 0 0 0 1
#   [375] 1 1 0 0 1 0 0 1 0 0 0 0 0 1 0 0 0 0 1 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0
#   [409] 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 1 0 0
#   [443] 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 1 1 0 0 1
#   [477] 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0 0 0 1 0 0 1 0 0
#   [511] 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 1 1 0 0 0 0 0 0 0 1 0 0 0 1 0
#   [545] 0 1 0 0 1 0 0 0 1 0 0 0 1 0 1 0 0 1 0 1 0 0 0 0 0 1 1 0 0 1 0 0 0 0
#   [579] 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0 0 1 0 0 0 0 1 0
#   [613] 0 1 0 1 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 1 1 0 0 0 0 0
#   [647] 1 0 0 1 1 0 0 0 0 1 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 1 0 0 0 0 1 0 0
#   [681] 0 0 0 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 1 0 1 1 0 0 0 1 0 0
#   [715] 1 0 0 0 0 1 0 1 1 0 0 0 0 0 1 0 0 0 0 0 0 1 1 0 0 1 1 1 0 1 1 0 1 1
#   [749] 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0
#   [783] 0 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 1 0 0 1 1 1 1
#   [817] 0 0 1 1 0 0 1 0 0 0 0 0 1 1 0 1 1 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0
#   [851] 0 0 0 1 1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0
#   [885] 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 1 0 1
#   [919] 0 0 0 1 0 0 1 1 0 1 0 0 1 0 0 0 1 1 0 0 1 0 0 0 0 0 1 1 1 0 0 0 0 1
#   [953] 0 1 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0 1 1 1 0 1 0 0
#   [987] 1 0 1 0 0 0 0 1 0 0 0 0 1 0
#   Levels: 0 1
#   > table(naive_predict)
#   naive_predict
#   0   1 
#   753 247 
#   > table(naive_predict,bank_loan$Default)
#   
#   naive_predict   0   1
#   0 607 146
#   1  93 154
#   > 











