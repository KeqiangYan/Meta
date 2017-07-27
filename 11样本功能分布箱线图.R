#根据ibaq对功能分布进行分析
cog<-read.table("all_COG_iBAQ.txt",header=TRUE,sep="\t")
Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
sc<-data.frame(cog,row.names = 1)
sc1<-t(sc)
sc1<-as.data.frame(sc1,row.names = F)
sc2<-as.data.frame(cbind(Sample,sc1))
library(reshape2)
sc3<-melt(sc2,id = "Sample")

head(sc3)
Category<-c(rep(c("Information Storage & Processing"),11),rep(c("Metabolism"),11),rep(c("Cell Process & Signaling"),11),rep(c("Metabolism"),55),rep(c("Information Storage & Processing"),33),rep(c("Cell Process & Signaling"),33),rep(c("Metabolism"),22),rep(c("Poorly Characterized"),22),rep(c("Cell Process & Signaling"),44))
new3<-cbind(sc3,Category)
colnames(new3)<-c("Sample","COG","Abundance","Category")
library(ggplot2)
ggplot(new3, aes(x=factor(COG), y=Abundance))+geom_boxplot(aes(fill=Category))+xlab("COG")+ylab("Abundance")


cb_palette <-c("#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2")
ggplot(new3,aes(x=Sample,y=Abundance,fill=COG))+geom_bar(stat = "identity",)+scale_fill_manual(values = cb_palette)
new4<-ddply(new3,"Sample",transform,
          percent_abundance= Abundance/sum(Abundance)*100)
ggplot(new4,aes(x=Sample,y=percent_abundance,fill=COG))+geom_bar(stat = "identity",)+scale_fill_manual(values = cb_palette)+
  xlab("Samples")+ylab("Abundance")
