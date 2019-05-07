#Regression Analysis with Multiple Variables

#Buyers are interested in determining the factors that influence the car mileage

setwd("C:/Users/MyPC/Desktop")
getwd()

cars_data<-read.csv("Demo 2_ Perform Regression Analysis with multiple variables.csv")
View(cars_data)

summary(cars_data)
str(cars_data)

cars_results<-lm(formula=MPG_City~Type+Origin+DriveTrain+EngineSize+Cylinders+Horsepower
                 +Weight+Wheelbase+Length,data=cars_data)
cars_results
summary(cars_results)

#Output on Console
# > setwd("C:/Users/MyPC/Desktop")
# > getwd()
# [1] "C:/Users/MyPC/Desktop"
# > cars_data<-read.csv("Demo 2_ Perform Regression Analysis with multiple variables.csv")
# > View(cars_data)
# > summary(cars_data)
# ï..Make                        Model         Type        Origin   
# Toyota       : 28   C240 4dr               :  2   Hybrid:  3   Asia  :158  
# Chevrolet    : 27   C320 4dr               :  2   Sedan :262   Europe:123  
# Mercedes-Benz: 26   G35 4dr                :  2   Sports: 49   USA   :147  
# Ford         : 23   3.5 RL 4dr             :  1   SUV   : 60               
# BMW          : 20   3.5 RL w/Navigation 4dr:  1   Truck : 24               
# Audi         : 19   300M 4dr               :  1   Wagon : 30               
# (Other)      :285   (Other)                :419                            
# DriveTrain       MSRP        Invoice      EngineSize      Cylinders     
# All  : 92   $13,270:  2   $14,207:  2   Min.   :1.300   Min.   : 3.000  
# Front:226   $15,389:  2   $19,638:  2   1st Qu.:2.375   1st Qu.: 4.000  
# Rear :110   $19,635:  2   $68,306:  2   Median :3.000   Median : 6.000  
# $19,860:  2   $10,107:  1   Mean   :3.197   Mean   : 5.808  
# $21,055:  2   $10,144:  1   3rd Qu.:3.900   3rd Qu.: 6.000  
# $21,595:  2   $10,319:  1   Max.   :8.300   Max.   :12.000  
# (Other):416   (Other):419                   NA's   :2       
#    Horsepower       MPG_City      MPG_Highway        Weight       Wheelbase    
#  Min.   : 73.0   Min.   :10.00   Min.   :12.00   Min.   :1850   Min.   : 89.0  
#  1st Qu.:165.0   1st Qu.:17.00   1st Qu.:24.00   1st Qu.:3104   1st Qu.:103.0  
#  Median :210.0   Median :19.00   Median :26.00   Median :3474   Median :107.0  
#  Mean   :215.9   Mean   :20.06   Mean   :26.84   Mean   :3578   Mean   :108.2  
#  3rd Qu.:255.0   3rd Qu.:21.25   3rd Qu.:29.00   3rd Qu.:3978   3rd Qu.:112.0  
#  Max.   :500.0   Max.   :60.00   Max.   :66.00   Max.   :7190   Max.   :144.0  
#                                                                                
#      Length     
#  Min.   :143.0  
#  1st Qu.:178.0  
#  Median :187.0  
#  Mean   :186.4  
#  3rd Qu.:194.0  
#  Max.   :238.0  
#                 
# > str(cars_data)
# 'data.frame':	428 obs. of  15 variables:
#  $ ï..Make    : Factor w/ 38 levels "Acura","Audi",..: 1 1 1 1 1 1 1 2 2 2 ...
#  $ Model      : Factor w/ 425 levels "3.5 RL 4dr","3.5 RL w/Navigation 4dr",..: 245 309 388 378 1 2 266 33 39 34 ...
#  $ Type       : Factor w/ 6 levels "Hybrid","Sedan",..: 4 2 2 2 2 2 3 2 2 2 ...
#  $ Origin     : Factor w/ 3 levels "Asia","Europe",..: 1 1 1 1 1 1 1 2 2 2 ...
#  $ DriveTrain : Factor w/ 3 levels "All","Front",..: 1 2 2 2 2 2 3 2 2 2 ...
#  $ MSRP       : Factor w/ 410 levels "$10,280","$10,539",..: 295 151 199 263 341 352 408 182 289 247 ...
#  $ Invoice    : Factor w/ 425 levels "$10,107","$10,144",..: 306 154 203 273 349 361 421 185 297 257 ...
#  $ EngineSize : num  3.5 2 2.4 3.2 3.5 3.5 3.2 1.8 1.8 3 ...
#  $ Cylinders  : int  6 4 4 6 6 6 6 4 4 6 ...
#  $ Horsepower : int  265 200 200 270 225 225 290 170 170 220 ...
#  $ MPG_City   : int  17 24 22 20 18 18 17 22 23 20 ...
#  $ MPG_Highway: int  23 31 29 28 24 24 24 31 30 28 ...
#  $ Weight     : int  4451 2778 3230 3575 3880 3893 3153 3252 3638 3462 ...
#  $ Wheelbase  : int  106 101 105 108 115 115 100 104 105 104 ...
#  $ Length     : int  189 172 183 186 197 197 174 179 180 179 ...
# > cars_results<-lm(formula=MPG_City~Type+Origin+DriveTrain+EngineSize+Cylinders+Horsepower
# +                  +Weight+Wheelbase+Length,data=cars_data)
# > cars_results
# 
# Call:
# lm(formula = MPG_City ~ Type + Origin + DriveTrain + EngineSize + 
#     Cylinders + Horsepower + Weight + Wheelbase + Length, data = cars_data)
# 
# Coefficients:
#     (Intercept)        TypeSedan       TypeSports          TypeSUV        TypeTruck  
#       64.922761       -28.234400       -29.428606       -29.339329       -29.082762  
#       TypeWagon     OriginEurope        OriginUSA  DriveTrainFront   DriveTrainRear  
#      -28.157836        -0.537962        -0.371973         1.076169         0.148866  
#      EngineSize        Cylinders       Horsepower           Weight        Wheelbase  
#       -0.247646        -0.172933        -0.012773        -0.002739         0.067798  
#          Length  
#       -0.052474  
# 
# > summary(cars_results)
# 
# Call:
# lm(formula = MPG_City ~ Type + Origin + DriveTrain + EngineSize + 
#     Cylinders + Horsepower + Weight + Wheelbase + Length, data = cars_data)
# 
# Residuals:
#     Min      1Q  Median      3Q     Max 
# -8.0895 -1.2792 -0.1612  0.8440 13.7522 
# 
# Coefficients:
#                   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)      6.492e+01  2.650e+00  24.496  < 2e-16 ***
# TypeSedan       -2.823e+01  1.237e+00 -22.817  < 2e-16 ***
# TypeSports      -2.943e+01  1.326e+00 -22.195  < 2e-16 ***
# TypeSUV         -2.934e+01  1.299e+00 -22.581  < 2e-16 ***
# TypeTruck       -2.908e+01  1.347e+00 -21.595  < 2e-16 ***
# TypeWagon       -2.816e+01  1.292e+00 -21.801  < 2e-16 ***
# OriginEurope    -5.380e-01  3.152e-01  -1.707  0.08867 .  
# OriginUSA       -3.720e-01  2.742e-01  -1.357  0.17565    
# DriveTrainFront  1.076e+00  3.289e-01   3.272  0.00116 ** 
# DriveTrainRear   1.489e-01  3.694e-01   0.403  0.68713    
# EngineSize      -2.476e-01  3.223e-01  -0.768  0.44272    
# Cylinders       -1.729e-01  1.839e-01  -0.941  0.34746    
# Horsepower      -1.277e-02  3.206e-03  -3.984 8.02e-05 ***
# Weight          -2.739e-03  3.869e-04  -7.080 6.30e-12 ***
# Wheelbase        6.780e-02  3.393e-02   1.998  0.04638 *  
# Length          -5.247e-02  1.767e-02  -2.970  0.00315 ** 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 2.09 on 410 degrees of freedom
#   (2 observations deleted due to missingness)
# Multiple R-squared:  0.847,	Adjusted R-squared:  0.8414 
# F-statistic: 151.3 on 15 and 410 DF,  p-value: < 2.2e-16
# 
# > 