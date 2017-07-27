#Hierarchical Cluster Analysis in R or Rstudio

#------------第一步：导入数据 ex.-------------------------------------------------

data(dune)

#-----------第二步：将原始转换成“距离”矩阵  #假设数据不需要进行标准化--------

library(vegan)

distance.ex<-vegdist(dune,method="euc",na.rm=TRUE)

#计算距离的method （Dissimilarity index）包括：

#"manhattan", "euclidean", "canberra","bray", "kulczynski", "jaccard", "gower", "altGower", "morisita", "horn","mountford", "raup" , "binomial", "chao", "cao" or "mahalanobis".

#其中"bray"是指 "Bray–Curtis Dissimilarity index"



#-----------第三步：聚类分析--------------------------------------------------------

hclust.ex <- hclust(distance.ex,method="ward.D2")

#聚类的方法包括：

#"ward.D", "ward.D2", "single", "complete", "average" (= UPGMA), "mcquitty"(= WPGMA), "median" (= WPGMC) or "centroid" (= UPGMC).

# 注意一般软件ward算法相对应的hclust中为ward.D2，小心用错

# agnes(*, method="ward") corresponds to hclust(*, "ward.D2").



#-----------第四步：作树状图--------------------------------------------------------

plot(hclust.ex,hang=-1)    # hang取负数时，树状图y轴 从0 开始。


spec<-read.table("all_sample_ibaq.txt",header = T,sep = "\t")
str(spec)
Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
sc<-data.frame(spec,row.names = 1)
sc1<-t(sc)
sc1<-as.data.frame(sc1,row.names = F)
sc2<-as.data.frame(cbind(Sample,sc1))
row.names(sc2)<-sc2[,1]
sc2<-sc2[,-1]
sc.scaled<-scale(sc2)
sc2[sc2==0]<-1
sc.scaled<--log10(sc2)
#d<-dist(sc.scaled,method = "bray")
distance.ex<-vegdist(sc.scaled,method="bray",na.rm=TRUE)
hclust.ex <- hclust(distance.ex,method="average")
plot(hclust.ex,hang=-1)

distance.ex<-vegdist(sc2,method="bray",na.rm=TRUE)
hclust.ex <- hclust(d,method="average")
plot(hclust.ex,hang=-1)
