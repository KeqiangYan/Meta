#deal with the raw data
env<-read.csv("t1.csv",header = T)
env<-env[c(1,2,4,5,6,7,8,9,10,11,12)]
spe<-read.table("all_COG_iBAQ.txt",header = T,sep = "\t")
spe<-spe[c(1,2,4,5,6,7,8,9,10,11,12)]
Sample<-c("S08","S12","S14","S16","S18","S20","S22","S24","S26","S28")
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
#e2<-e2[,c(6,7,9)]
sc<-data.frame(spe,row.names = 1)
sc1<-t(sc)
sc1<-as.data.frame(sc1,row.names = F)
sc2<-as.data.frame(cbind(Sample,sc1))
row.names(sc2)<-sc2[,1]
sc2<-sc2[,-1]

#对数据进行标准化后，其结果可信度似乎更高了，可以考虑在后面的分析选择log归一化。
sc3<--log2(sc2)
e3<--log2(e2)

#sc3<-scale(sc2,center = F,scale = T)
#e3<-scale(e2,center = F,scale = T)
#e3<-as.data.frame(e3)
#e2[11,2]<-min(e2$Silicate>0)*0.01
#NMDS analysis
library(vegan)

decorana(sc3)#choose method（Aixs lengths <3,choose RDA)
#NMDS分析
vare.dis<-vegdist(sc3,method = "bray")
vare.mds0 <- monoMDS(vare.dis)
stressplot(vare.mds0, vare.dis)
ordiplot(vare.mds0, type = "t")
#vare.mds<-metaMDS(vare.dis,k=2)
vare.mds<-metaMDS(sc3,distance="bray",trace=F)
plot(vare.mds,display=c("site","species"),type="t")
ef=envfit(vare.mds,e3,permu=999)
ef

#PCA分析
vare.pca<-rda(sc3)
vare.pca<-rda(sc3,scale=T)
biplot(vare.pca,scaling=3)
ef=envfit(vare.pca,e2,permu=999)
ef

#总的环境因子的分析
sc.rda<-rda(sc3~.,data=e3)
permutest(sc.rda,permu=999)
ef=envfit(sc.rda,e3,permu=999)
ef
#4种环境因子的分析
sc.rda3<-rda(sc3~Phosphate+Salinity+Temperature,data=e3)
permutest(sc.rda3,permu=999)

ef=envfit(sc.rda3,e3,permu=999)
ef
RsquareAdj(sc.rda3)
anova(sc.rda3)

#绘图-三种环境因子
new<-sc.rda3$CCA
new
samples<-data.frame(sample=row.names(new$u),RDA1=new$u[,1],RDA2=new$u[,2])
samples
species<-data.frame(spece=row.names(new$v),RDA1=new$v[,1],RDA2=new$v[,2])
species
envi<-data.frame(en=row.names(new$biplot),RDA1=new$biplot[,1],RDA2=new$biplot[,2])
envi
line_x =c(0,envi[1,2],0,envi[2,2],0,envi[3,2])
line_x
line_y =c(0,envi[1,3],0,envi[2,3],0,envi[3,3])
line_y
line_g =c("Phosphate","Phosphate","Salinity","Salinity","Temperature","Temperature")
line_g
line_data =data.frame(x=line_x,y=line_y,group=line_g)

line_data
library(ggplot2)
ggplot(data=samples,aes(RDA1,RDA2)) +geom_point(color="red") +
  #geom_point() +
  geom_text(data=envi,aes(label=en),color="blue") +
  geom_hline(yintercept=0) + geom_vline(xintercept=0)+
  geom_line(data=line_data,aes(x=x,y=y,group=group),color="green")+
  geom_text(data=samples,aes(label=sample),color="red",hjust=-0.1,size=5)+
  geom_text(data=species,aes(label=spece),color="black",hjust=-0.1,size=5)+
  theme_bw() + theme(panel.grid=element_blank())
ggsave("RDA-GOS.PDF")

