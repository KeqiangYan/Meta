c<-read.table("all_COG_iBAQ.txt",header = T,sep = "\t")
c$iBAQ<-apply(c[,2:12],1,sum)
all<-data.frame(c$Functional_Categories,c$iBAQ)
colnames(all)<-c("Functional_Categories","Abundance")
library(ggplot2)
ggplot(all,aes(x=Functional_Categories,y=Abundance))+geom_bar(stat = "identity",fill = 'steelblue')+
  xlab("Functional Categories")





Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
c1<-data.frame(c,row.names = 1)
c2<-t(c1)
c1<-as.data.frame(c2,row.names = F)
c2<-cbind(Sample,c1)
library(reshape2)
c3<-melt(c2,id="Sample")
Category<-c(rep(c("Cell Process & Signaling"),11),rep(c("Metabolism"),11),rep(c("Cell Process & Signaling"),11),rep(c("Metabolism"),55),rep(c("Information Storage & Processing"),33),rep(c("Cell Process & Signaling"),33),rep(c("Metabolism"),22),rep(c("Function unknown"),22),rep(c("Cell Process & Signaling"),44))
c4<-cbind(c3,Category)
colnames(c4)<-c("Sample","COG","Abundance","Category")
library(ggplot2)
ggplot(c4, aes(x=factor(COG), y=Abundance))+geom_boxplot(aes(fill=Category))+xlab("COG")+ylab("Abundance")

cb_palette <-c("#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2")
ggplot(c4,aes(x=Sample,y=Abundance,fill=COG))+geom_bar(stat = "identity",)+scale_fill_manual(values = cb_palette)
