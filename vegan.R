#vegan_learning

decorana(sc2)
decorana(e2)
sc.pca<-rda(sc2,scale=T)
sc.pca
ord <- metaMDS(sc2)
ord
summary(sc.pca,scaling=3)
biplot(sc.pca)
plot(sc.pca)
e2.pca<-rda(e2)
biplot(e2.pca)
sc.ca<-cca(sc2)
sc.ca
plot(sc.ca,scaling=1)
sc.rda<-rda(sc2,e2)
sc.rda<-rda(sc2~Phosphate+Silicate+Ammonium+Nitrite+Nitrate+Temperature+Salinity+PH+Chla,data=e2)
plot(sc.rda,display = c("sp","bp","si"),scaling = 3)

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
  #geom_hline(yintercept=0) + geom_vline(xintercept=0)+
  geom_line(data=line_data,aes(x=x,y=y,group=group),color="black")+
  geom_text(data=samples,aes(label=sample),color="red",hjust=-0.1,size=5)+
  theme_bw() + theme(panel.grid=element_blank())
ggsave("RDA2.PDF")