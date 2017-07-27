env<-read.csv("t1.csv",header = T)
spe<-read.table("all_sample_ibaq.txt",header = T,sep = "\t")
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
e2$Chla<-as.numeric(e2$Chla)

sc<-data.frame(spe,row.names = 1)
sc1<-t(sc)
sc1<-as.data.frame(sc1,row.names = F)
sc2<-as.data.frame(cbind(Sample,sc1))
row.names(sc2)<-sc2[,1]
sc2<-sc2[,-1]
library(vegan)
rankindex(sc2,e2)
vare.dis <- vegdist(sc2, method="bray");range(vare.dis)
require(MASS)
vare.mds0 <- isoMDS(vare.dis) 
ordiplot(vare.mds0, type = "t")
stressplot(vare.mds0, vare.dis)
vare.mds <- metaMDS(sc2, trace = T)
plot(vare.mds, type = "t") 

ordiplot(vare.mds,type="t")
treat=c(rep("Treatment1",6),rep("Treatment2",5))
ordihull(vare.mds,draw="polygon",groups=treat,col="grey90",label=F)
orditorp(vare.mds,display="species",col="red",air=0.01)
orditorp(vare.mds,display="sites",col=c(rep("green",6),rep("blue",5)),
         air=0.01,cex=1.25)


clust <- hclust(vare.dis);clust
par(mar=c(5,4,4,2));plot(clust);rect.hclust(clust, 3)
clust <- hclust(vare.dis,method="mcquitty");clust
clust <- hclust(vare.dis,method="average");clust
