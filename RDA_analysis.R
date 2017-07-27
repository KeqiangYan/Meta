#deal with the raw data
env<-read.csv("t1.csv",header = T)
spe<-read.table("RDA_all_samples_GOS.txt",header = T,sep = "\t")
Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
env<-data.frame(env,row.names = 1)
e1<-t(env)
e11<-as.data.frame(e1,row.names = F)
e2<-as.data.frame(cbind(Sample,e1))
row.names(e2)<-e2[,1]
e2<-e2[,-1]
e2$Phosphate<-as.numeric(as.character(e2$Phosphate))
e2$Silicate<-as.numeric(as.character(e2$Silicate))
e2$Ammonium<-as.numeric(as.character(e2$Ammonium))
e2$Nitrite<-as.numeric(as.character(e2$Nitrite))
e2$Nitrate<-as.numeric(as.character(e2$Nitrate))
e2$Temperature<-as.numeric(as.character(e2$Temperature))
e2$Salinity<-as.numeric(as.character(e2$Salinity))
e2$PH<-as.numeric(as.character(e2$PH))
e2$Chla<-as.numeric(as.character(e2$Chla))
sc<-data.frame(spe,row.names = 1)
sc1<-t(sc)
sc1<-as.data.frame(sc1,row.names = F)
sc2<-as.data.frame(cbind(Sample,sc1))
row.names(sc2)<-sc2[,1]
sc2<-sc2[,-1]
#NMDS analysis
library(vegan)
decorana(sc2)#choose method£¨Aixs lengths <3,choose RDA)
sc.rda<-rda(sc2~Phosphate+Silicate+Ammonium+Nitrite+Nitrate+Temperature+Salinity+PH+Chla,data=e2)
#factor significance detect
permutest(sc.rda,permu=999)
ef=envfit(sc.rda,e2,permu=999)
ef
new<-sc.rda$CCA

new
samples<-data.frame(sample=row.names(new$u),RDA1=new$u[,1],RDA2=new$u[,2])
samples
species<-data.frame(spece=row.names(new$v),RDA1=new$v[,1],RDA2=new$v[,2])
species
envi<-data.frame(en=row.names(new$biplot),RDA1=new$biplot[,1],RDA2=new$biplot[,2])
envi
line_x =c(0,envi[1,2],0,envi[2,2],0,envi[3,2],0,envi[4,2],0,envi[5,2],0,envi[6,2],0,envi[7,2],0,envi[8,2],0,envi[9,2])
line_x
line_y =c(0,envi[1,3],0,envi[2,3],0,envi[3,3],0,envi[4,3],0,envi[5,3],0,envi[6,3],0,envi[7,3],0,envi[8,3],0,envi[9,3])
line_y
line_g =c("Phosphate","Phosphate","Silicate","Silicate","Ammonium","Ammonium","Nitrite","Nitrite","Nitrate","Nitrate","Temperature","Temperature","Salinity","Salinity","PH","PH","Chla","Chla")
line_g
line_data =data.frame(x=line_x,y=line_y,group=line_g)

line_data
library(ggplot2)
ggplot(data=samples,aes(RDA1,RDA2)) +geom_point(color="red") +
  geom_point(data=species,aes(color=spece),size=6) +
  geom_text(data=envi,aes(label=en),color="blue") +
  geom_hline(yintercept=0) + geom_vline(xintercept=0)+
  geom_line(data=line_data,aes(x=x,y=y,group=group),color="green")+
  geom_text(data=samples,aes(label=sample),color="red",hjust=-0.1,size=5)+
  theme_bw() + theme(panel.grid=element_blank())
ggsave("RDA2.PDF")



pairs(e2)
cor.test(e2$Phosphate,e2$Silicate,method = "spearman")
cor.test(e2$Phosphate,e2$Silicate,method = "spearman")
library(psych)
corr.test(e2)
