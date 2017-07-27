# 层次聚类方法，注意原始文件中排列的顺序并不是S8在第一列的，分析时一定要看清楚了，不然容易犯错！！！
spe<-read.table("all_sample_iBAQ_normalization.txt",header = T,sep = "\t")
str(spe)
#Sample<-c("S10","S12","S14","S16","S18","S20","S22","S24","S26","S28","S08")
Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
sc<-data.frame(spe,row.names = 1)
sc1<-t(sc)
sc1<-as.data.frame(sc1,row.names = F)
sc2<-as.data.frame(cbind(Sample,sc1))
row.names(sc2)<-sc2[,1]
sc2<-sc2[,-1]
d<-dist(sc.scaled, method = "euclidean")
fit.average<-hclust(d,method = "complete")
plot(fit.average,hang=-0.1,cex=1.5,check=T,axes=F,frame.plot=F,ann=F,sub=NULL,xlab=NULL,ylab="Height",main="Complete Linkage Clustering")



sc2[sc2==0]<-min(sc2[sc2>0])*0.01
sc2<-log10(sc2)
#sc2<-sc2[,c(1:19)]
sc.scaled<-scale(sc2)
d<-dist(sc.scaled, method = "euclidean")
d<-dist(sc2,method="euclidean")
png("ward.png",width = 500,height = 500)
fit.average<-hclust(d,method = "ward.D")
plot(fit.average,hang=-1,cex=.8,main="Ward Linkage Clustering")
dev.off()
png("single.png",width = 500,height = 500)
fit.average<-hclust(d,method = "single")
plot(fit.average,hang=-1,cex=.8,main="Single Linkage Clustering")
dev.off()
png("average.png",width = 500,height = 500)

fit.average<-hclust(d,method = "average")
plot(fit.average,hang=-1,cex=.8,main="Average Linkage Clustering")






dev.off()
png("complete.png",width = 500,height = 500)
fit.average<-hclust(d,method = "complete")
plot(fit.average,hang=-1,cex=.8,main="Complete Linkage Clustering")
dev.off()
png("centroid.png",width = 500,height = 500)
fit.average<-hclust(d,method = "centroid")
plot(fit.average,hang=-1,cex=.8,main="Centroid Linkage Clustering")
dev.off()

install.packages("NbClust")
library(NbClust)
devAskNewPage(ask=T)
nc<-NbClust(sc.scaled,distance = "euclidean",min.nc = 2,max.nc = 15,method = "average")
table(nc$Best.n[1,])
barplot(table(nc$Best.n[1,]),
              xlab="Number of Clusters",ylab="Number of Criteria",
              main="Number of Clusters Chosen by 26 Criteria")
clusters<-cutree(fit.average,k=2)
table(clusters)
aggregate(sc2,by=list(cluster=clusters),median)
aggregate(as.data.frame(sc.scaled),by=list(cluster=clusters),median)
plot(fit.average,hang=-1,cex=.8)

fit.average
rect.hclust(fit.average,k=2)



