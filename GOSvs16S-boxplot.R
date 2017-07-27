y1<-read.table("GOSvs16S.txt",sep = "\t",header = T)
library(dplyr)
y11<-log(y1[,-1])
y111<-cbind(y1$Sample,y11)
y11<-select(y1,c("Sample","Alphaproteobacteria","Cyanobacteria","Actinobacteria","Bacteroidetes","Deltaproteobacteria","Gammaproteobacteria","Verrucomicrobia"))
library(reshape2)
y2<-melt(y111,ID="y1$Sample")
colnames(y2)<-c("Samples","Species","Ratio")
library(ggplot2)
ggplot(y2,aes(x=Species,y=Ratio,fill=Species))+geom_boxplot()+
  geom_abline(intercept = 0,slope=0,size=1,linetype="dashed",color="red")+
  theme(legend.position = c(0,0),legend.justification = c(0,0),axis.title.x = element_blank(),axis.text.x = element_blank())+
  theme(legend.background = element_blank(),legend.key = element_blank())+
  theme(legend.text = element_text(face = "italic",size=12))+
  guides(fill=guide_legend(title=NULL))
