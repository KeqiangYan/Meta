#根据ibaq对功能分布进行分析
cog<-read.table("all_N_iBAQ.txt",header=TRUE,sep="\t")
Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
sc<-data.frame(cog,row.names = 1)
sc1<-t(sc)
sc1<-as.data.frame(sc1,row.names = F)
sc2<-as.data.frame(cbind(Sample,sc1))
library(reshape2)
sc3<-melt(sc2,id = "Sample")
head(sc3)
Category<-c(rep(c("Metabolism"),11),rep(c("Cell Process & Signaling"),11),rep(c("Metabolism"),55),rep(c("Information Storage & Processing"),33),rep(c("Cell Process & Signaling"),33),rep(c("Metabolism"),22),rep(c("Poorly Characterized"),22),rep(c("Cell Process & Signaling"),44))
new3<-cbind(sc3,Category)
colnames(sc3)<-c("Sample","Taxnomy","Abundance")
library(ggplot2)
library(RColorBrewer)
ggplot(sc3, aes(x=factor(Taxnomy), y=Abundance))+geom_boxplot(fill="steelblue")+xlab("Taxnomy")+
  ylab("Abundance")


cb_palette <-c("#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2")
ggplot(sc3,aes(x=Sample,y=Abundance,fill=Taxnomy))+geom_bar(stat = "identity",)+scale_fill_manual(values = cb_palette)
  #scale_fill_brewer(palette="BrBG")
  
