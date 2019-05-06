#Demo-2 Assigning Values and applying functions

# age variable is imported as ï..age. Renaming variable to Age

install.packages("plyr")
library(plyr)

BankCustomer=read.csv("Demo 2_ Assigning values and applying functions.csv")
View(BankCustomer)
str(BankCustomer)
BankCustomer=rename(BankCustomer,c("ï..age"="Age"))
max(BankCustomer$Age)
min(BankCustomer$Age)

BankCustomerAgeCategorized = transform(BankCustomer,Generation=ifelse(Age<22,"Z",ifelse(Age<53,"X","BabyBoomers")))
View(BankCustomerAgeCategorized)

#2way Frequency Table
table(BankCustomerAgeCategorized$Generation,BankCustomerAgeCategorized$poutcome)

#Outcome from Console
# > library(plyr)
# > 
#   > BankCustomer=read.csv("Demo 2_ Assigning values and applying functions.csv")
# > View(BankCustomer)
# > str(BankCustomer)
# 'data.frame':	4521 obs. of  15 variables:
#   $ ï..age   : int  30 33 35 30 59 35 36 39 41 43 ...
# $ job      : Factor w/ 12 levels "admin.","blue-collar",..: 11 8 5 5 2 5 7 10 3 8 ...
# $ marital  : Factor w/ 3 levels "divorced","married",..: 2 2 3 2 2 3 2 2 2 2 ...
# $ education: Factor w/ 4 levels "primary","secondary",..: 1 2 3 3 2 3 3 2 3 1 ...
# $ default  : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
# $ housing  : Factor w/ 2 levels "no","yes": 1 2 2 2 2 1 2 2 2 2 ...
# $ loan     : Factor w/ 2 levels "no","yes": 1 2 1 2 1 1 1 1 1 2 ...
# $ contact  : Factor w/ 3 levels "cellular","telephone",..: 1 1 1 3 3 1 1 1 3 1 ...
# $ month    : Factor w/ 12 levels "apr","aug","dec",..: 11 9 1 7 9 4 9 9 9 1 ...
# $ day      : int  19 11 16 3 5 23 14 6 14 17 ...
# $ duration : int  79 220 185 199 226 141 341 151 57 313 ...
# $ campaign : int  1 1 1 4 1 2 1 2 2 1 ...
# $ pdays    : int  -1 339 330 -1 -1 176 330 -1 -1 147 ...
# $ previous : int  0 4 1 0 0 3 2 0 0 2 ...
# $ poutcome : Factor w/ 4 levels "failure","other",..: 4 1 1 4 4 1 2 4 4 1 ...
# > BankCustomer=rename(BankCustomer,c("ï..age"="Age"))
# > max(BankCustomer$Age)
# [1] 87
# > min(BankCustomer$Age)
# [1] 19
# > 
#   > BankCustomerAgeCategorized = transform(BankCustomer,Generation=ifelse(Age<22,"Z",ifelse(Age<53,"X","BabyBoomers")))
# > View(BankCustomerAgeCategorized)
# > install.packages("plyr")
# WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
#   
#   https://cran.rstudio.com/bin/windows/Rtools/
#   Installing package into ‘C:/Users/MyPC/Documents/R/win-library/3.6’
# (as ‘lib’ is unspecified)
# Warning in install.packages :
#   package ‘plyr’ is in use and will not be installed
# > table(BankCustomerAgeCategorized$Generation,BankCustomerAgeCategorized$poutcome)
# 
# failure other success unknown
# BabyBoomers      79    25      36     610
# X               410   170      92    3085
# Z                 1     2       1      10
# > 