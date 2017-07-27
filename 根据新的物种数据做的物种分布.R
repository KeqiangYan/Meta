sp<-read.table("spe_distribution.txt",header = T,sep = "\t",fill = T,quote = "")
library(reshape2)
library(dplyr)
sp1<-sp %>% group_by(Classify) %>% 
  summarise(sum(S08),sum(S10),sum(S12),sum(S14),sum(S16),sum(S18),sum(S20),sum(S22),sum(S24),sum(S26),sum(S28))
colnames(sp1)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
sp2<-melt(sp1,id="Species")
colnames(sp2)<-c("Species","Sample","Abundance")
library(plyr)
sp3<-ddply(sp2,"Sample",transform,
          percent_abundance= Abundance/sum(Abundance)*100)
library(ggplot2)
cb_palette <-c("#999999","#E69F00","#F0E442","#009E73","#0072B2","#D55E00","#BB4444","#7777DD","#CC6666","#4477AA","#FFDDDD","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#CC79A7","#0072B2","#56B4E9","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#CC79A7","#D55E00","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2")
ggplot(sp3,aes(x=Sample,y=percent_abundance,fill=Species))+geom_bar(stat = "identity",)+scale_fill_manual(values = cb_palette)+
  xlab("Samples")+ylab("Relative Abundance (%)")
write.table(sp1,file="Species_Abundance.txt",col.names=T,row.names=F,sep = "\t")

sp4<-sp3 %>% select (Species,Sample,percent_abundance)
colnames(sp4)<-c("Species","Sample","Abundance_Percent")
sp5<-dcast(sp4,Species ~ Sample, value.var="Abundance_Percent")
write.table(sp5,file="Species_Abundance_Percent.txt",col.names=T,row.names=F,sep = "\t")
