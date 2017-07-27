#根据ibaq对功能分布进行分析
cog<-read.table("COG_sample_ibaq.txt",header=TRUE,sep="\t")
Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
sc<-data.frame(cog,row.names = 1)
sc1<-t(sc)
sc1<-as.data.frame(sc1,row.names = F)
sc2<-as.data.frame(cbind(Sample,sc1))
library(reshape2)
sc3<-melt(sc2,id = "Sample")
head(sc3)
colnames(sc3)<-c("Sample","COG","Abundance")
library(ggplot2)
#library(plyr)
#sc4<-ddply(sc3,"Sample",transform,
#           percent_spectra=Spectra/sum(Spectra)*100)
cb_palette <-c("#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2")
ggplot(sc3,aes(x=Sample,y=Abundance,fill=COG))+geom_bar(stat = "identity",)+guides(fill=guide_legend(reverse = TRUE))+scale_fill_manual(values = cb_palette)
#特征功能丰度比较
high<-sc2[,c(1,3,5,6,7,8,16,17)]
h1<-melt(high,id = "Sample")
colnames(h1)<-c("Sample","COG","Abundance")
cb_palette <-c("#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00")
png("target_all_abundance.png",width = 550,height = 500)
ggplot(h1,aes(x=Sample,y=Abundance,fill=COG))+geom_bar(stat = "identity",)+guides(fill=guide_legend(reverse = TRUE))+scale_fill_manual(values = cb_palette)
dev.off()
#低丰度物种比较
low<-sc2[,-c(3,5,6,7,8,16,17)]
l1<-melt(low,id = "Sample")
colnames(l1)<-c("Sample","COG","Abundance")
cb_palette <-c("#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00")
png("other_all_abundance.png",width = 550,height = 500)
ggplot(l1,aes(x=Sample,y=Abundance,fill=COG))+geom_bar(stat = "identity",)+guides(fill=guide_legend(reverse = TRUE))+scale_fill_manual(values = cb_palette)
dev.off()