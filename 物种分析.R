#结合ibaq对不同样本的功能进行比较分析
species<-read.table("all_sample_iBAQ.txt",sep = "\t",header = T)
s2<-species[order(-species$iBAQ_10),]
Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
snew<-data.frame(s2,row.names = 1)
t1<-t(snew)
t2<-as.data.frame(t1,row.names = F)
t3<-as.data.frame(cbind(Sample,t2))
s1_5<-t3[,1:6]
s6_10<-t3[,c(1,7,8,9,10,11)]
s11_16<-t3[,c(1,12,13,14,15,16,17)]
s17_22<-t3[,c(1,18,19,20,21,22,23)]
daixie<-t3[,c(1,3,5,7,8,9,13,14,19)]
xinxi<-t3[,c(1,2,4,10,12)]
xibao<-t3[,c(1,6,15,17,18,20,21,22,23)]
library(ggplot2)
library(reshape2)
m1<-melt(xibao, id=c("Sample"))
names(m1)<-c("Sample","Function","Percent")
#p1<-ggplot(m1,aes(x=Sample,y=iBAQ,fill=Function))+geom_bar(stat="identity")+scale_fill_manual(values = rainbow(12))
ggplot(m1,aes(x=Sample,y=Percent))+geom_bar(stat="identity",fill="white",colour="black")+facet_grid(Function ~.,scales = "free")
p2<-ggplot(m1,aes(x=Sample,y=iBAQ,colour=Class,group=Class))+geom_line()+geom_point()
p3<-ggplot(m1,aes(x=Sample,y=iBAQ,colour=Class,group=Class))+geom_line()+geom_point()+facet_grid(Class ~.,scale="free")

