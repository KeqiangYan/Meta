install.packages("flexclust")
data(nutrient,package = "flexclust")
row.names(nutrient)<-tolower(row.names(nutrient))
nutrient.scaled<-scale(nutrient)
d<-dist(nutrient.scaled)
fit.average<-hclust(d,method = "average")
plot(fit.average,hang=-1,cex=.8,main="Average Linkage Clustering")

library(NbClust)
devAskNewPage(ask=T)
nc<-NbClust(nutrient.scaled,distance = "euclidean",min.nc = 2,max.nc = 15,method = "average")
table(nc$Best.n[1,])
barplot(table(nc$Best.n[1,]),
        xlab="Number of Clusters",ylab="Number of Criteria",
        main="Number of Clusters Chosen by 26 Criteria")


library(cluster)
set.seed(1234)
install.packages("rattle")
data(wine,package = "rattle")
fit.pam<-pam(wine[-1],k=3,metric = "euclidean",stand=T)
fit.pam$medoids
clusplot(fit.pam)
