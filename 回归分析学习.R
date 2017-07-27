library(ggplot2)
#setwd("C:/Users/Chunli/Desktop/frequency.csv")
gcl<-read.csv("frequency_scan.csv",header=T)
ggplot(data=gcl,aes(x=reorder(frequency,number),y=number,fill=frequency))+
  geom_bar(stat="identity",color="blue")+
  theme(axis.text.x=element_text(angle=60,hjust=1))+
  geom_text(aes(label=number),vjust=0.01,color="black")


library(vcd)
mytable<-xtabs(~Treatment+Improved,data=Arthritis)
library(MASS)
t.test(Prob~So, data=UScrime)
UScrime
sapply(UScrime[c("U1","U2")],function(x)(c(mean=mean(x),sd=sd(x))))
with(UScrime,t.test(U1,U2,paired = TRUE))
with(UScrime,by(Prob,So,median))
states<-data.frame(state.region,state.x77)
kruskal.test(Illiteracy~state.region, data = states)

fit<-lm(weight ~ height, data = women)
summary(fit)
plot(women$weight,women$height)
abline(fit)
fitted(fit)
residuals(fit)

fit2<-lm(weight ~ height +I(height^2),data=women)
summary(fit2)
a<-lines(women$height,fitted(fit2))
library(car)
scatterplot(weight~height,data=women)
women$height
women$weight
#多元线性回归
states<-as.data.frame(state.x77[,c("Murder","Population","Illiteracy","Income","Frost")])
cor(states)
labrary(car)
library(car)
scatterplotMatrix(states,spread = FALSE, smoother.args = list(lty=2))
fit<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
#有显著交互项的多元线性回归
fit<-lm(mpg~hp+wt+hp:wt,data=mtcars)
summary(fit)
library(effects)
plot(effect("hp:wt",fit,, list(wt=c(2.2,3.2,4.2))),multiline=T)
