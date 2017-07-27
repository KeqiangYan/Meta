s16<-read.table("16S_data.txt",header = T,sep = "\t")
colnames(s16)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
library(reshape2)
s17<-melt(s16,id="Species")
colnames(s17)<-c("Species","Sample","Abundance")
library(ggplot2)
ggplot(s17,aes(x=Sample,y=Abundance,fill=Species))+geom_bar(stat = "identity",)+scale_fill_manual(values = cb_palette)+
  xlab("Samples")+ylab("Relative Abundance (%)")

gos<-read.table("16s-GOS.txt",header = T,sep = "\t")
g17<-melt(gos,id="Species")
colnames(g17)<-c("Species","Sample","Abundance")
ggplot(g17,aes(x=Sample,y=Abundance,fill=Species))+geom_bar(stat = "identity",)+scale_fill_manual(values = cb_palette)+
  xlab("Samples")+ylab("Relative Abundance (%)")

