env<-read.csv("t1.csv",header = T)
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

spe<-read.table("all_samplewgs_ibaq.txt",header = T,sep = "\t")
sc<-data.frame(spe,row.names = 1)
sc1<-t(sc)
sc1<-as.data.frame(sc1,row.names = F)
sc2<-as.data.frame(cbind(Sample,sc1))
row.names(sc2)<-sc2[,1]
sc2<-sc2[,-1]
#环境变量与物种分析-逐一分析
sp<-sc2[c(-2,-11),c(-18,-21,-22)]
ev<-e2[c(-2,-11),]
ev<-e2
sp<-s11[-2,]
#for cant be used
cor.test(sp[,1],ev[,1],method="pearson")
i=1
j=1
while(i<20){
  for (j in 1:9){
    ss<-sp[,i]
    ee<-ev[,j]
    a[i,j]<-cor.test(ss,ee,method="pearson")
    j=j+1
  }
  i=i+1
}

cor.test(sp[,1],ev[,1],method="pearson")
cor.test(sp[,1],ev[,2],method="pearson")
cor.test(sp[,1],ev[,3],method="pearson")
cor.test(sp[,1],ev[,4],method="pearson")
cor.test(sp[,1],ev[,5],method="pearson")
cor.test(sp[,1],ev[,6],method="pearson")
cor.test(sp[,1],ev[,7],method="pearson")
cor.test(sp[,1],ev[,8],method="pearson")
cor.test(sp[,1],ev[,9],method="pearson")

cor.test(sp[,2],ev[,1],method="pearson")
cor.test(sp[,2],ev[,2],method="pearson")
cor.test(sp[,2],ev[,3],method="pearson")
cor.test(sp[,2],ev[,4],method="pearson")
cor.test(sp[,2],ev[,5],method="pearson")
cor.test(sp[,2],ev[,6],method="pearson")
cor.test(sp[,2],ev[,7],method="pearson")
cor.test(sp[,2],ev[,8],method="pearson")
cor.test(sp[,2],ev[,9],method="pearson")

cor.test(sp[,3],ev[,1],method="pearson")
cor.test(sp[,3],ev[,2],method="pearson")
cor.test(sp[,3],ev[,3],method="pearson")
cor.test(sp[,3],ev[,4],method="pearson")
cor.test(sp[,3],ev[,5],method="pearson")
cor.test(sp[,3],ev[,6],method="pearson")
cor.test(sp[,3],ev[,7],method="pearson")
cor.test(sp[,3],ev[,8],method="pearson")
cor.test(sp[,3],ev[,9],method="pearson")

cor.test(sp[,4],ev[,1],method="pearson")
cor.test(sp[,4],ev[,2],method="pearson")
cor.test(sp[,4],ev[,3],method="pearson")
cor.test(sp[,4],ev[,4],method="pearson")
cor.test(sp[,4],ev[,5],method="pearson")
cor.test(sp[,4],ev[,6],method="pearson")
cor.test(sp[,4],ev[,7],method="pearson")
cor.test(sp[,4],ev[,8],method="pearson")
cor.test(sp[,4],ev[,9],method="pearson")

cor.test(sp[,5],ev[,1],method="pearson")
cor.test(sp[,5],ev[,2],method="pearson")
cor.test(sp[,5],ev[,3],method="pearson")
cor.test(sp[,5],ev[,4],method="pearson")
cor.test(sp[,5],ev[,5],method="pearson")
cor.test(sp[,5],ev[,6],method="pearson")
cor.test(sp[,5],ev[,7],method="pearson")
cor.test(sp[,5],ev[,8],method="pearson")
cor.test(sp[,5],ev[,9],method="pearson")

cor.test(sp[,6],ev[,1],method="pearson")
cor.test(sp[,6],ev[,2],method="pearson")
cor.test(sp[,6],ev[,3],method="pearson")
cor.test(sp[,6],ev[,4],method="pearson")
cor.test(sp[,6],ev[,5],method="pearson")
cor.test(sp[,6],ev[,6],method="pearson")
cor.test(sp[,6],ev[,7],method="pearson")
cor.test(sp[,6],ev[,8],method="pearson")
cor.test(sp[,6],ev[,9],method="pearson")

cor.test(sp[,7],ev[,1],method="pearson")
cor.test(sp[,7],ev[,2],method="pearson")
cor.test(sp[,7],ev[,3],method="pearson")
cor.test(sp[,7],ev[,4],method="pearson")
cor.test(sp[,7],ev[,5],method="pearson")
cor.test(sp[,7],ev[,6],method="pearson")
cor.test(sp[,7],ev[,7],method="pearson")
cor.test(sp[,7],ev[,8],method="pearson")
cor.test(sp[,7],ev[,9],method="pearson")

cor.test(sp[,8],ev[,1],method="pearson")
cor.test(sp[,8],ev[,2],method="pearson")
cor.test(sp[,8],ev[,3],method="pearson")
cor.test(sp[,8],ev[,4],method="pearson")
cor.test(sp[,8],ev[,5],method="pearson")
cor.test(sp[,8],ev[,6],method="pearson")
cor.test(sp[,8],ev[,7],method="pearson")
cor.test(sp[,8],ev[,8],method="pearson")
cor.test(sp[,8],ev[,9],method="pearson")

cor.test(sp[,9],ev[,1],method="pearson")
cor.test(sp[,9],ev[,2],method="pearson")
cor.test(sp[,9],ev[,3],method="pearson")
cor.test(sp[,9],ev[,4],method="pearson")
cor.test(sp[,9],ev[,5],method="pearson")
cor.test(sp[,9],ev[,6],method="pearson")
cor.test(sp[,9],ev[,7],method="pearson")
cor.test(sp[,9],ev[,8],method="pearson")
cor.test(sp[,9],ev[,9],method="pearson")

cor.test(sp[,10],ev[,1],method="pearson")
cor.test(sp[,10],ev[,2],method="pearson")
cor.test(sp[,10],ev[,3],method="pearson")
cor.test(sp[,10],ev[,4],method="pearson")
cor.test(sp[,10],ev[,5],method="pearson")
cor.test(sp[,10],ev[,6],method="pearson")
cor.test(sp[,10],ev[,7],method="pearson")
cor.test(sp[,10],ev[,8],method="pearson")
cor.test(sp[,10],ev[,9],method="pearson")

cor.test(sp[,11],ev[,1],method="pearson")
cor.test(sp[,11],ev[,2],method="pearson")
cor.test(sp[,11],ev[,3],method="pearson")
cor.test(sp[,11],ev[,4],method="pearson")
cor.test(sp[,11],ev[,5],method="pearson")
cor.test(sp[,11],ev[,6],method="pearson")
cor.test(sp[,11],ev[,7],method="pearson")
cor.test(sp[,11],ev[,8],method="pearson")
cor.test(sp[,11],ev[,9],method="pearson")

cor.test(sp[,12],ev[,1],method="pearson")
cor.test(sp[,12],ev[,2],method="pearson")
cor.test(sp[,12],ev[,3],method="pearson")
cor.test(sp[,12],ev[,4],method="pearson")
cor.test(sp[,12],ev[,5],method="pearson")
cor.test(sp[,12],ev[,6],method="pearson")
cor.test(sp[,12],ev[,7],method="pearson")
cor.test(sp[,12],ev[,8],method="pearson")
cor.test(sp[,12],ev[,9],method="pearson")


cor.test(sp[,13],ev[,1],method="pearson")
cor.test(sp[,13],ev[,2],method="pearson")
cor.test(sp[,13],ev[,3],method="pearson")
cor.test(sp[,13],ev[,4],method="pearson")
cor.test(sp[,13],ev[,5],method="pearson")
cor.test(sp[,13],ev[,6],method="pearson")
cor.test(sp[,13],ev[,7],method="pearson")
cor.test(sp[,13],ev[,8],method="pearson")
cor.test(sp[,13],ev[,9],method="pearson")

cor.test(sp[,14],ev[,1],method="pearson")
cor.test(sp[,14],ev[,2],method="pearson")
cor.test(sp[,14],ev[,3],method="pearson")
cor.test(sp[,14],ev[,4],method="pearson")
cor.test(sp[,14],ev[,5],method="pearson")
cor.test(sp[,14],ev[,6],method="pearson")
cor.test(sp[,14],ev[,7],method="pearson")
cor.test(sp[,14],ev[,8],method="pearson")
cor.test(sp[,14],ev[,9],method="pearson")

cor.test(sp[,15],ev[,1],method="pearson")
cor.test(sp[,15],ev[,2],method="pearson")
cor.test(sp[,15],ev[,3],method="pearson")
cor.test(sp[,15],ev[,4],method="pearson")
cor.test(sp[,15],ev[,5],method="pearson")
cor.test(sp[,15],ev[,6],method="pearson")
cor.test(sp[,15],ev[,7],method="pearson")
cor.test(sp[,15],ev[,8],method="pearson")
cor.test(sp[,15],ev[,9],method="pearson")

cor.test(sp[,16],ev[,1],method="pearson")
cor.test(sp[,16],ev[,2],method="pearson")
cor.test(sp[,16],ev[,3],method="pearson")
cor.test(sp[,16],ev[,4],method="pearson")
cor.test(sp[,16],ev[,5],method="pearson")
cor.test(sp[,16],ev[,6],method="pearson")
cor.test(sp[,16],ev[,7],method="pearson")
cor.test(sp[,16],ev[,8],method="pearson")
cor.test(sp[,16],ev[,9],method="pearson")

cor.test(sp[,17],ev[,1],method="pearson")
cor.test(sp[,17],ev[,2],method="pearson")
cor.test(sp[,17],ev[,3],method="pearson")
cor.test(sp[,17],ev[,4],method="pearson")
cor.test(sp[,17],ev[,5],method="pearson")
cor.test(sp[,17],ev[,6],method="pearson")
cor.test(sp[,17],ev[,7],method="pearson")
cor.test(sp[,17],ev[,8],method="pearson")
cor.test(sp[,17],ev[,9],method="pearson")

cor.test(sp[,18],ev[,1],method="pearson")
cor.test(sp[,18],ev[,2],method="pearson")
cor.test(sp[,18],ev[,3],method="pearson")
cor.test(sp[,18],ev[,4],method="pearson")
cor.test(sp[,18],ev[,5],method="pearson")
cor.test(sp[,18],ev[,6],method="pearson")
cor.test(sp[,18],ev[,7],method="pearson")
cor.test(sp[,18],ev[,8],method="pearson")
cor.test(sp[,18],ev[,9],method="pearson")

cor.test(sp[,19],ev[,1],method="pearson")
cor.test(sp[,19],ev[,2],method="pearson")
cor.test(sp[,19],ev[,3],method="pearson")
cor.test(sp[,19],ev[,4],method="pearson")
cor.test(sp[,19],ev[,5],method="pearson")
cor.test(sp[,19],ev[,6],method="pearson")
cor.test(sp[,19],ev[,7],method="pearson")
cor.test(sp[,19],ev[,8],method="pearson")
cor.test(sp[,19],ev[,9],method="pearson")


cor.test(sp$Alphaproteobacteria,ev$Phosphate,method="pearson")
a<-data.frame(spo4$Alphaproteobacteria,PO4)
ggplot(a,aes(x=a$spo4.Alphaproteobacteria,y=a$PO4))+
  geom_point()+stat_smooth(method=lm)




