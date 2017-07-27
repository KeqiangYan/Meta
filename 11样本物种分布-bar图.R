c<-read.table("WGS-species.txt",header = T,sep = "\t")
Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
c1<-data.frame(c,row.names = 1)
c2<-t(c1)
c1<-as.data.frame(c2,row.names = F)
c2<-cbind(Sample,c1)
library(reshape2)
c3<-melt(c2,id="Sample")
colnames(c3)<-c("Sample","Species","Abundance")
library(ggplot2)
ggplot(c3, aes(x=factor(Species), y=Abundance))+geom_boxplot()+xlab("Species")+ylab("Abundance")

cb_palette <-c("#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#BB4444","#7777DD","#CC6666","#4477AA","#CCEEFF","#FFDDDD","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2")
library(plyr)
c4<-ddply(c3,"Sample",transform,
          percent_abundance= Abundance/sum(Abundance)*100)
ggplot(c4,aes(x=Sample,y=percent_abundance,fill=Species))+geom_bar(stat = "identity",)+scale_fill_manual(values = cb_palette)+
  xlab("Samples")+ylab("Relative Abundance (%)")
