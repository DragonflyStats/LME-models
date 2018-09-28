

#BA99.data

#Run the following code only once
BA99.data<- read.csv(file="BA99.csv",head=FALSE,sep=",")
  #Run the following code only once - removes the unnecessary indices
BA99.data=BA99.data[,-1]

  #510 Observations (85 subjects 2 methods 3 Replicates )

ob.js<-c(BA99.data[,1],BA99.data[,2],BA99.data[,3],
BA99.data[,7],BA99.data[,8],BA99.data[,9])

  #using two methods
method<-c(rep("J",(3*85)),rep("S",(3*85)))
method=factor(method)
  #85 subjects
seq2<-c(1:85)
subj=c(rep(seq2,6))                                                
subj=factor(subj)
  #3 replicates on each subject

repl<-method<-c(rep("1",85),rep("2",85),rep("3",85),
rep("1",85),rep("2",85),rep("3",85))



##############################################################
#using packages LME4 and NLME
library(lme4)
library(nlme)




###############################################################
lm(ob.js~method)    #indicates bias

###############################################################
#Dataframe
BA99<-data.frame(ob.js, method,subj,repl)          




################################################################
#Fits

fit1<-lme(ob.js ~ method, data =BA99, random = ~1|subj)
fit2<-lme(ob.js ~ method, data =BA99, random = ~1|subj/method)
fit3<-lme(ob.js ~ 1+ method, data =BA99, random = ~1|subj)
fit4<-lme(ob.js ~ 1+ method, data =BA99, random = ~ -1 + 1|subj )
fit5<-lme(ob.js ~  method, data =BA99, random = ~1|subj/repl/method)
fit6<-lme(ob.js ~  -1 - method, data =BA99, random = ~1|subj/repl/method)


##############################################################################



