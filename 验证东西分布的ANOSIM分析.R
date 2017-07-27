spe<-read.table("all_samplewgs_ibaq.txt",header = T,sep = "\t")
sc<-data.frame(spe,row.names = 1)
sc1<-t(sc)
sc1<-as.data.frame(sc1,row.names = F)
sc2<-as.data.frame(cbind(Sample,sc1))
row.names(sc2)<-sc2[,1]
sc2<-sc2[,-1]

distance.bray<-vegdist(sc2,method = 'bray')
hclust.fish<-hclust(distance.bray,method = "centroid")
plot(hclust.fish)
sc2$group<-c(rep("East",6),rep("West",5))
anosim.result<-anosim(distance.bray,sc2$group,permutations = 999)
summary(anosim.result)
plot(anosim.result)

library(MASS)
e2$group<-c(rep("East",6),rep("West",5))
e3<-e2[-2,]
e4<-e2[-11,]
wilcox.test(e3$Phosphate ~ e3$group)
wilcox.test(e3$Silicate ~ e3$group)
wilcox.test(e3$Ammonium ~ e3$group)
wilcox.test(e3$Nitrite ~ e3$group)
wilcox.test(e3$Nitrate ~ e3$group)
wilcox.test(e2$Temperature ~ e2$group)
wilcox.test(e2$Salinity ~ e2$group)
wilcox.test(e2$PH ~ e2$group)
wilcox.test(e4$Chla ~ e4$group)



e3<-e2[c(-2,-11),-8]
distance.bray<-vegdist(e3,method = 'bray')
hclust.fish<-hclust(distance.bray,method = "centroid")
plot(hclust.fish)
sc2$group<-c(rep("East",6),rep("West",5))
anosim.result<-anosim(distance.bray,sc2$group,permutations = 999)
summary(anosim.result)
plot(anosim.result)
#后面这些分析并不适用于我的样本，无法找到组的指示物种！
library(indicspecies)
data(wetland)
#最好可以根据环境因子将地域分成不同的group
groups = c(rep(1, 17), rep(2, 14), rep(3,10))
wetkm = kmeans(wetland, centers=3)
groupskm = wetkm$cluster
#进行分组指示物种分析
indval = multipatt(wetland,groups,control = how(nperm=999))
#A和B分别表示这个指示物只在这个group中存在的概率，B表示这个指示物在这个group所有样本都存在的比率
summary(indval, indvalcomp=TRUE)
#展示所有物种信息
summary(indval, alpha=1)
indval$sign

group<-c(rep("East",6),rep("West",5))
indval = multipatt(sc2,group,control = how(nperm=999))
