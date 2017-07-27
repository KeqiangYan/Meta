#NA ¥¶¿Ì
data(sleep,package = "VIM")
sleep[complete.cases(sleep),]
sleep[!complete.cases(sleep),]
mean(is.na(sleep$Dream))
library(mice)
md.pattern(sleep)
library("VIM")
aggr(sleep,prop=F,numbers=T)
matrixplot(sleep)
marginplot(sleep[c("Gest","Dream")],pch=c(20),
           col=c("darkgray","red","blue"))

library(mice)
data(sleep,package = "VIM")
imp<- mice(sleep,seed=1234)
fit<-with(imp,lm(Dream~Span + Gest))
pooled <-pool(fit)
summary(pooled)
imp
