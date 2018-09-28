Using the`lme` function - Orthodont
========================================================
The fitted model is an object of class `lme` representing the linear mixed-effects model fit. Generic functions such as `print`, `plot` and `summary` have methods to show the results of the fit. 

```r
library(nlme)
data(Orthodont)
tail(Orthodont)
```

```
## Grouped Data: distance ~ age | Subject
##     distance age Subject    Sex
## 103     19.0  12     F10 Female
## 104     19.5  14     F10 Female
## 105     24.5   8     F11 Female
## 106     25.0  10     F11 Female
## 107     28.0  12     F11 Female
## 108     28.0  14     F11 Female
```

```r
lm1 <- lm(distance ~ age, data = Orthodont)
fm1 <- lme(distance ~ age, data = Orthodont, method = "ML")  # random is ~ age
summary(lm1)
```

```
## 
## Call:
## lm(formula = distance ~ age, data = Orthodont)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -6.504 -1.578 -0.183  1.352  6.317 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   16.761      1.226   13.68  < 2e-16 ***
## age            0.660      0.109    6.05  2.2e-08 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.54 on 106 degrees of freedom
## Multiple R-squared:  0.256,	Adjusted R-squared:  0.249 
## F-statistic: 36.6 on 1 and 106 DF,  p-value: 2.25e-08
```

```r
AIC(lm1)
```

```
## [1] 511.6
```

```r
summary(fm1)
```

```
## Linear mixed-effects model fit by maximum likelihood
##  Data: Orthodont 
##     AIC   BIC logLik
##   451.2 467.3 -219.6
## 
## Random effects:
##  Formula: ~age | Subject
##  Structure: General positive-definite
##             StdDev Corr  
## (Intercept) 2.1941 (Intr)
## age         0.2149 -0.581
## Residual    1.3100       
## 
## Fixed effects: distance ~ age 
##             Value Std.Error DF t-value p-value
## (Intercept) 16.76    0.7679 80  21.827       0
## age          0.66    0.0706 80   9.354       0
##  Correlation: 
##     (Intr)
## age -0.848
## 
## Standardized Within-Group Residuals:
##       Min        Q1       Med        Q3       Max 
## -3.305963 -0.487430  0.007598  0.482236  3.922792 
## 
## Number of Observations: 108
## Number of Groups: 27
```

```r
AIC(fm1)
```

```
## [1] 451.2
```


```r
fm2 <- lme(distance ~ age + Sex, data = Orthodont, random = ~1)

summary(fm2)
```

```
## Linear mixed-effects model fit by REML
##  Data: Orthodont 
##     AIC   BIC logLik
##   447.5 460.8 -218.8
## 
## Random effects:
##  Formula: ~1 | Subject
##         (Intercept) Residual
## StdDev:       1.807    1.432
## 
## Fixed effects: distance ~ age + Sex 
##              Value Std.Error DF t-value p-value
## (Intercept) 17.707    0.8339 80  21.233  0.0000
## age          0.660    0.0616 80  10.716  0.0000
## SexFemale   -2.321    0.7614 25  -3.048  0.0054
##  Correlation: 
##           (Intr) age   
## age       -0.813       
## SexFemale -0.372  0.000
## 
## Standardized Within-Group Residuals:
##      Min       Q1      Med       Q3      Max 
## -3.74890 -0.55034 -0.02517  0.45342  3.65747 
## 
## Number of Observations: 108
## Number of Groups: 27
```


You can also embed plots, for example:


```r
par(mfrow = c(2, 2))
plot(fm2, pch = 18)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 

```r
par(mfrow = c(1, 1))
```


