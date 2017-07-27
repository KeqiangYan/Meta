#deal with the raw data
env<-read.csv("t1.csv",header = T)
env<-env[c(1,2,4,5,6,7,8,9,10,11,12)]
spe<-read.table("all_sample_wgs_ibaq.txt",header = T,sep = "\t")
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
#选择合适的物种进行分析，WGS和GOS在这一点上稍有不同
sc2<-sc2[,c(-4,-5,-11,-18,-20,-21,-22)]
#NMDS analysis
library(vegan)
decorana(sc2)#choose method（Aixs lengths <3,choose RDA)

#NMDS分析
vare.dis<-vegdist(sc2)
vare.mds0 <- monoMDS(vare.dis)
stressplot(vare.mds0, vare.dis)
ordiplot(vare.mds0, type = "t")
vare.mds<-metaMDS(sc2,trace=F)
plot(vare.mds,type="t")
ef=envfit(vare.mds,e2,permu=999)
ef
#PCA分析
vare.pca<-rda(sc2)
vare.pca<-rda(sc2,scale=T)
biplot(vare.pca,scaling=3)
ef=envfit(vare.pca,e2,permu=999)
ef

#总的环境因子的分析
sc.rda<-rda(sc2~.,data=e2)
permutest(sc.rda,permu=999)
ef=envfit(sc.rda,e2,permu=999)
ef
#三种环境因子的分析
sc.rda3<-rda(sc2~Phosphate+Salinity+Nitrate,data=e2)
permutest(sc.rda3,permu=999)
e3<-e2[,c(1,5,7)]
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
line_g =c("Phosphate","Phosphate","Salinity","Salinity","Nitrate","Nitrate")
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
ggsave("RDA-WGS.PDF")
