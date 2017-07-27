c<-read.table("all_COG_iBAQ.txt",header = T,sep = "\t")
Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
c1<-data.frame(c,row.names = 1)
c2<-t(c1)
c1<-as.data.frame(c2,row.names = F)
c2<-cbind(Sample,c1)
cc2<-c2[,c(1,3,5,7,10,12,15,17)]
library(reshape2)
cc3<-melt(cc2,id="Sample")
group<-c(rep(c(rep(c("East"),6),rep(c("West"),5)),7))
c4<-cbind(cc3,group)
colnames(c4)<-c("Sample","COG","Abundance","Group")
ggplot(c4, aes(x=factor(COG), y=Abundance))+geom_boxplot(aes(fill=Group))+xlab("COG")+ylab("Abundance")

cc4<-c2[,c(1,3,5,6,7,8,9,16,17)]
library(reshape2)
cc6<-melt(cc4,id="Sample")
group<-c(rep(c(rep(c("East"),5),rep(c("West"),6)),8))
c4<-cbind(cc6,group)


