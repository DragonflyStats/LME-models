### R code from vignette source '/home/bates/Documents/slides/2011-08-15-Coventry/1Simple.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
options(width=69,show.signif.stars=FALSE,str=strOptions(strict.width="cut"))
library(lattice)
library(Rcpp)
library(minqa)
library(Matrix)
library(MatrixModels)
library(lme4a)
lattice.options(default.theme = function() standard.theme())
if (file.exists("classroom.rda")) {
    load("classroom.rda")
} else {
    classroom <- within(read.csv("http://www-personal.umich.edu/~bwest/classroom.csv"),
                    {
                        classid <- factor(classid)
                        schoolid <- factor(schoolid)
                        sex <- factor(sex, labels = c("M","F"))
                        minority <- factor(minority, labels = c("N", "Y"))
                    })
    save(classroom, file="classroom.rda")
}


###################################################
### code chunk number 2: installlme4 (eval = FALSE)
###################################################
## install.packages("lme4a",
##     repos="http://lme4.r-forge.r-project.org/repos")


###################################################
### code chunk number 3: require (eval = FALSE)
###################################################
## require(lme4a)


###################################################
### code chunk number 4: attach (eval = FALSE)
###################################################
## library(lme4a)


###################################################
### code chunk number 5: Dyestuffstr
###################################################
str(Dyestuff)
summary(Dyestuff)


###################################################
### code chunk number 6: Dyestuffplot
###################################################
set.seed(1234543)
print(dotplot(reorder(Batch, Yield) ~ Yield, Dyestuff,
              ylab = "Batch", jitter.y = TRUE, pch = 21, aspect = 0.32,
              xlab = "Yield of dyestuff (grams of standard color)",
              type = c("p", "a")))


###################################################
### code chunk number 7: fm1
###################################################
fm1 <- lmer(Yield ~ 1 + (1|Batch), Dyestuff)
print(fm1)


###################################################
### code chunk number 8: op
###################################################
op <- options(digits=5)


###################################################
### code chunk number 9: extractors
###################################################
fixef(fm1)
ranef(fm1, drop = TRUE)
fitted(fm1)


###################################################
### code chunk number 10: unop
###################################################
options(op)


###################################################
### code chunk number 11: strfm1
###################################################
str(as.matrix(model.matrix(fm1)))
fm1@re@Zt


###################################################
### code chunk number 12: fm1ranef
###################################################
print(dotplot(ranef(fm1, postVar = TRUE), strip = FALSE)[[1]])


###################################################
### code chunk number 13: update
###################################################
(fm1M <- update(fm1, REML = FALSE))


###################################################
### code chunk number 14: fm1refit
###################################################
invisible(update(fm1, verbose = 2))


###################################################
### code chunk number 15: Dyestuff2
###################################################
str(Dyestuff2)


###################################################
### code chunk number 16: Dyestuff2plot
###################################################
print(dotplot(reorder(Batch, Yield) ~ Yield, Dyestuff2,
              ylab = "Batch", jitter.y = TRUE, pch = 21, aspect = 0.42,
              xlab = "Simulated response (dimensionless)",
              type = c("p", "a")))


###################################################
### code chunk number 17: fm1A
###################################################
(fm1A <- lmer(Yield ~ 1 + (1|Batch), Dyestuff2, REML=FALSE))


###################################################
### code chunk number 18: lm1
###################################################
summary(lm1 <- lm(Yield ~ 1, Dyestuff2))
logLik(lm1)


###################################################
### code chunk number 19: fm1call
###################################################
fm1@call


###################################################
### code chunk number 20: Penicillinstr
###################################################
str(Penicillin)
xtabs(~ sample + plate, Penicillin)


###################################################
### code chunk number 21: PenicillinPlot
###################################################
print(dotplot(reorder(plate, diameter) ~ diameter, Penicillin, groups = sample,
              ylab = "Plate", xlab = "Diameter of growth inhibition zone (mm)",
              type = c("p", "a"), auto.key = list(columns = 6, lines = TRUE)))


###################################################
### code chunk number 22: fm2
###################################################
(fm2 <- lmer(diameter ~ 1 + (1|plate) + (1|sample), Penicillin))


###################################################
### code chunk number 23: 1Simple.Rnw:527-528
###################################################
op <- options(digits = 5)


###################################################
### code chunk number 24: ranef2
###################################################
ranef(fm2, drop = TRUE)


###################################################
### code chunk number 25: 1Simple.Rnw:543-544
###################################################
options(op)


###################################################
### code chunk number 26: fm2ranef
###################################################
qrr2 <- dotplot(ranef(fm2, postVar = TRUE), strip = FALSE)
print(qrr2[[1]], pos = c(0,0,1,0.75), more = TRUE)
print(qrr2[[2]], pos = c(0,0.65,1,1))


###################################################
### code chunk number 27: fm2Z
###################################################
print(image(fm2@re@Zt, xlab = NULL, ylab = NULL, sub = "Z'"))


###################################################
### code chunk number 28: fm2formula
###################################################
fm2@call[["formula"]]


###################################################
### code chunk number 29: Pastesstr
###################################################
str(Pastes)
xtabs(~ batch + sample, Pastes, sparse = TRUE)


###################################################
### code chunk number 30: samplegen (eval = FALSE)
###################################################
## Pastes <- within(Pastes, sample <- factor(batch:cask))


###################################################
### code chunk number 31: Pastesplot
###################################################
Pastes <- within(Pastes, bb <- reorder(batch, strength))
Pastes <- within(Pastes, ss <- reorder(reorder(sample, strength),
          as.numeric(batch)))
print(dotplot(ss ~ strength | bb, Pastes,
              strip = FALSE, strip.left = TRUE, layout = c(1, 10),
              scales = list(y = list(relation = "free")),
              ylab = "Sample within batch", type = c("p", "a"),
              xlab = "Paste strength", jitter.y = TRUE))


###################################################
### code chunk number 32: fm3
###################################################
(fm3 <- lmer(strength ~ 1 + (1|batch) + (1|sample), Pastes))


###################################################
### code chunk number 33: fm3ranef
###################################################
qrr3 <- dotplot(ranef(fm3, postVar = TRUE), strip = FALSE)
print(qrr3[[1]], pos = c(0,0,1,0.75), more = TRUE)
print(qrr3[[2]], pos = c(0,0.65,1,1))


###################################################
### code chunk number 34: Z3fig
###################################################
print(image(fm3@re@Zt, xlab = NULL, ylab = NULL, sub = NULL))


###################################################
### code chunk number 35: fm3LRT
###################################################
fm3M <- update(fm3, REML = FALSE)
fm4M <- lmer(strength ~ 1 + (1|sample),
             Pastes, REML = FALSE)
anova(fm4M, fm3M)


###################################################
### code chunk number 36: fm4
###################################################
(fm4 <- update(fm4M, REML = TRUE))


###################################################
### code chunk number 37: xtabsclass
###################################################
xtabs( ~ xtabs(~ classid, classroom))


###################################################
### code chunk number 38: xtabsclass
###################################################
table(xtabs(~ schoolid,
    unique(subset(classroom, select = c(classid, schoolid)))))


###################################################
### code chunk number 39: Schoolsplot
###################################################
refactor <- function(x) if(is.factor(x)) factor(x) else x
sch12 <- do.call(data.frame,
                 lapply(subset(classroom,
                               schoolid %in% c(12,15, 17, 33,46, 57,
                                               68, 70, 71, 76, 85, 99)),
                        refactor))
sch12 <- within(sch12, ss <- reorder(schoolid, mathgain))
sch12 <- within(sch12, cc <- reorder(reorder(classid, mathgain),
          as.numeric(schoolid)))
print(dotplot(cc ~ mathgain | ss , sch12, 
              strip = FALSE, strip.left = TRUE, layout = c(1, 12),
              scales = list(y = list(relation = "free")), pch = 21,
              ylab = "Class within school", type = c("p", "a"),
              xlab = "Mathematics gain from kindergarten to grade 1",
              jitter.y = TRUE))


###################################################
### code chunk number 40: fm5
###################################################
(fm5 <- lmer(mathgain ~ 1 + (1|classid) + (1|schoolid),
             classroom))


###################################################
### code chunk number 41: fm6
###################################################
print(fm6 <- lmer(mathgain ~ 1 + mathkind + minority + sex + ses + housepov
                  + (1|classid) + (1|schoolid), classroom), corr = FALSE)


###################################################
### code chunk number 42: fm7
###################################################
print(fm7 <- lmer(mathgain ~ 1 + mathkind + minority + ses + housepov
                  + (1|classid) + (1|schoolid), classroom), corr = FALSE)


###################################################
### code chunk number 43: fm8
###################################################
print(fm8 <- lmer(mathgain ~ mathkind + minority + ses
                  + (1|classid) + (1|schoolid), classroom), corr = FALSE)


###################################################
### code chunk number 44: Classpredi
###################################################
print(dotplot(ranef(fm8, post = "TRUE"), strip = FALSE,
              scales = list(y = list(draw = FALSE)))$classid)


###################################################
### code chunk number 45: classpred2show
###################################################
qqmath(ranef(fm8, post = TRUE))$classid


###################################################
### code chunk number 46: Classpred2
###################################################
print(qqmath(ranef(fm8, post = TRUE),strip=FALSE)$classid)


###################################################
### code chunk number 47: Schoolpred
###################################################
print(qqmath(ranef(fm8, post = TRUE),strip=FALSE)$schoolid)


###################################################
### code chunk number 48: fm9
###################################################
print(fm9M <- lmer(mathgain ~ mathkind + minority + ses
                   + (1|schoolid), classroom, REML = FALSE), corr = FALSE)


###################################################
### code chunk number 49: fm8Manova
###################################################
fm8M <- update(fm8, REML = FALSE)
anova(fm9M, fm8M)


