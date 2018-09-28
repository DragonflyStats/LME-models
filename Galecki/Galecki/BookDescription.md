Book Description
=====================================
Linear mixed-effects models (LMMs) are an important class of statistical models that can be used to 
analyze correlated data. Such data are encountered in a variety of fields including biostatistics, 
public health, psychometrics, educational measurement, and sociology. 

This book aims to support a wide range of uses for the models by applied researchers in those and 
other fields by providingstate-of-the-art descriptions of the implementation of LMMs in R. 

To help readers to get familiar with the features of the models and the details of carrying them out 
in R, the book includes a review of the most important theoretical concepts of the models. 
The presentation connects theory, software and applications. It is built up incrementally, starting
with a summary of the concepts underlying simpler classes of linear models like the classical regression 
model, and carrying them forward to LMMs. 

A similar step-by-step approach is used to describe the R tools for LMMs. All the
classes of linear models presented in the book are illustrated using real-life data. The book also 
introduces several novel R tools for LMMs, including new class of variance-covariance structure for 
random-effects, methods for influence diagnostics and for power calculations. They are included into
an R package that should assist the readers in
applying these and other methods presented in this text.


#### nlmeU
Linear mixed-effects models using R. A step-by-step approach “Linear mixed effects models (LMM) using R” is built as a step by step incremental description of a modelling tool used extensively in the analysis of hierarchical structured datasets. This work is a balanced collection of concepts and examples from various research areas which not only suggest the multitude of potential applications of the LMMs but also emphasise the features of both theory and chosen software (R, namely the LMM packages nlme and lme4.0). The book is structured in 4 parts. 

The first, Introduction, spans over three chapters and consists of a description of datasets underlining the difficulties in analysis which could be solved using features of the LMMs. The third chapter, Data exploration, provides useful visualization techniques and introduces the user to the R environment. 

The second part, Linear models for independent observations, spans over chapters 4 to 9 and presents linear models with homogenous and heterogeneous variance accompanied by examples using the lm() and gls() functions in R. 

The third part describes linear fixed effects models for correlated data. The model specification, the estimation and diagnostics, as well as mean-variance models are presented in detail. 

The fourth and most extensive part of the book, on linear mixed effects models, commences with the description of the theoretical concepts. Next, in chapter 14, the lme() function is presented in great detail using a real dataset to illustrate both the required steps that could lead to informative results and the manner in which the user can specify and fit a linear mixed effects model. 

Chapter 15 is dedicated to the lmer() function and the description of models with crossed and nested random effects. The detailed description of concepts and R functions based on them is followed by a new set of examples which model visual acuity (chapter 16), muscle fibre specific force (chapter 17), gains in mathematics achievement scores (chapter 18) and attainment-target scores (chapter 19). The book concludes with a review of extensions of R tools for the linear mixed effects models, briefly presented in chapter 20. In addition to a great collection of theory and examples, a state of art description of LMMs in R, the authors developed the R package nlmeU which contains the datasets and presented R code, making this book a milestone in its field.
