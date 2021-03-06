### R code from vignette source '/home/bates/Documents/slides/2011-08-15-Coventry/4GLMM.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
options(width = 70, show.signif.stars = FALSE)
data(Contraception, package = "mlmRev")
library(lattice)
library(Matrix)
library(MatrixModels)
library(Rcpp)
library(minqa)
library(lme4a)
lattice.options(default.theme = function() standard.theme())
lattice.options(default.theme = function() standard.theme(color=FALSE))


###################################################
### code chunk number 2: BernoulliLink
###################################################
logit <- function(mu) {
  mu <- pmax(.Machine$double.eps, pmin(1-.Machine$double.eps, mu))
  log(mu/(1-mu))
}
mu <- seq(0.001, 0.999, len = 999)
print(xyplot(logit(mu) ~ mu, type = c("g", "l"), 
             xlab = expression(mu), 
             ylab = expression(eta == log(frac(mu, 1-mu)))))


###################################################
### code chunk number 3: BernoulliinvLink
###################################################
linkinv <- function(eta) 1/(1+exp(-eta))
eta <- seq(-7,7,len = 701)
print(xyplot(linkinv(eta) ~ eta, type = c("g","l"), 
             xlab = expression(eta),
             ylab = expression(mu == frac(1,1+exp(-eta)))))


###################################################
### code chunk number 4: Contra1
###################################################
print(xyplot(ifelse(use == "Y", 1, 0) ~ age|urban, Contraception,
             groups = livch, type = c("g", "smooth"),
             auto.key = list(space = "top", points = FALSE,
             lines = TRUE, columns = 4),
             ylab = "Proportion", xlab = "Centered age"))


###################################################
### code chunk number 5: cm1
###################################################
print(cm1 <- glmer(use ~ age + I(age^2) + urban + livch + (1|district), 
             Contraception, binomial, nAGQ=0L), corr = FALSE)


###################################################
### code chunk number 6: ch
###################################################
Contraception$ch <- factor(Contraception$livch != 0, labels = c("N","Y"))


###################################################
### code chunk number 7: cm2
###################################################
print(cm2 <- glmer(use ~ age + I(age^2) + urban + ch + (1|district),
                  Contraception, binomial, nAGQ=0L), corr = FALSE)


###################################################
### code chunk number 8: anovac
###################################################
anova(cm2, cm1)


###################################################
### code chunk number 9: Contra2
###################################################
print(xyplot(ifelse(use == "Y", 1, 0) ~ age|urban, Contraception,
             groups = ch, type = c("g", "smooth"),
             auto.key = list(space = "top", points = FALSE,
             lines = TRUE, columns = 2),
             ylab = "Proportion", xlab = "Centered age"))


###################################################
### code chunk number 10: cm3
###################################################
print(cm3 <- glmer(use ~ age*ch + I(age^2) + urban + (1|district),
                   Contraception, binomial, nAGQ=0L), corr = FALSE)


###################################################
### code chunk number 11: ContraCat
###################################################
print(qqmath(ranef(cm3, post=TRUE), strip=FALSE)[[1]])


###################################################
### code chunk number 12: urbanRural
###################################################
cat(head(capture.output(xtabs(~urban+district, Contraception)),16),sep='\n')


###################################################
### code chunk number 13: cm4
###################################################
(cm4 <- glmer(use ~ age*ch + I(age^2) + urban + (urban|district),
              Contraception, binomial, nAGQ=0L))


###################################################
### code chunk number 14: anovacm4
###################################################
anova(cm4,cm3)


###################################################
### code chunk number 15: ContraCat2
###################################################
print(qqmath(ranef(cm4, post = TRUE))$district)


###################################################
### code chunk number 16: ContraSc
###################################################
print(plot(ranef(cm4), type = c("g","p"), aspect = 1)$district)


###################################################
### code chunk number 17: cm5
###################################################
print(cm5 <- glmer(use ~ age*ch + I(age^2) + urban + (1|urban:district) + (1|district),
                   Contraception, binomial, nAGQ=0L), corr=FALSE)


###################################################
### code chunk number 18: cm6
###################################################
print(cm6 <- glmer(use ~ age*ch + I(age^2) + urban + (1|urban:district),
                   Contraception, binomial, nAGQ=0L), corr=FALSE)


###################################################
### code chunk number 19: anovacm654
###################################################
anova(cm6,cm5,cm4)


###################################################
### code chunk number 20: cm6stages
###################################################
cm6 <- glmer(use ~ age*ch + I(age^2) + urban + (1|urban:district),
              Contraception, binomial, verbose=2L)


