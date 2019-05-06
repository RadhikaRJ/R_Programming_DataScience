#Simple Linear Regression
#Pedict weight based on Height

setwd("C:/Users/MyPC/Desktop")
getwd()
Class<-read.csv("Demo 1_Perform simple linear regression.csv")
View(Class)
str(Class)
summary(Class)

results<-lm(formula=Weight~Height,data=Class)
results

results1 <- lm(formula= Class$Weight~Class$Height)
results1

summary(results)

#Output from Console
# > setwd("C:/Users/MyPC/Desktop")
# > getwd()
# [1] "C:/Users/MyPC/Desktop"
# > Class<-read.csv("Demo 1_Perform simple linear regression.csv")
# > View(Class)
# > str(Class)
# 'data.frame':	19 obs. of  5 variables:
#   $ ï..Name: Factor w/ 19 levels "Alfred","Alice",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ Sex    : Factor w/ 2 levels "F","M": 2 1 1 1 2 2 1 1 2 2 ...
# $ Age    : int  14 13 13 14 14 12 12 15 13 12 ...
# $ Height : num  69 56.5 65.3 62.8 63.5 57.3 59.8 62.5 62.5 59 ...
# $ Weight : num  112 84 98 102 102 ...
# > summary(Class)
# ï..Name   Sex         Age            Height          Weight      
# Alfred : 1   F: 9   Min.   :11.00   Min.   :51.30   Min.   : 50.50  
# Alice  : 1   M:10   1st Qu.:12.00   1st Qu.:58.25   1st Qu.: 84.25  
# Barbara: 1          Median :13.00   Median :62.80   Median : 99.50  
# Carol  : 1          Mean   :13.32   Mean   :62.34   Mean   :100.03  
# Henry  : 1          3rd Qu.:14.50   3rd Qu.:65.90   3rd Qu.:112.25  
# James  : 1          Max.   :16.00   Max.   :72.00   Max.   :150.00  
# (Other):13                                                          
# > results<-lm(formula=Weight~Height,data=Class)
# > results
# 
# Call:
#   lm(formula = Weight ~ Height, data = Class)
# 
# Coefficients:
#   (Intercept)       Height  
# -143.027        3.899  
# 
# > 
#   > results1 <- lm(formula= Class$Weight~Class$Height)
# > results1
# 
# Call:
#   lm(formula = Class$Weight ~ Class$Height)
# 
# Coefficients:
#   (Intercept)  Class$Height  
# -143.027         3.899  
# 
# > summary(results)
# 
# Call:
#   lm(formula = Weight ~ Height, data = Class)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -17.6807  -6.0642   0.5115   9.2846  18.3698 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -143.0269    32.2746  -4.432 0.000366 ***
#   Height         3.8990     0.5161   7.555 7.89e-07 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 11.23 on 17 degrees of freedom
# Multiple R-squared:  0.7705,	Adjusted R-squared:  0.757 
# F-statistic: 57.08 on 1 and 17 DF,  p-value: 7.887e-07
# 
# > 