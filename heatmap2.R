#根据物种和COG功能做图，单样本。
t<-read.table("26I_S10.tax",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
#correlation caculation

t1<-r[,c(1,2,3,4,6,9,10,11,12,14)]
t2<-apply(t1,2,function(x) myfunction(x))
myfunction<-function(x){
  result<-x*100000
  return(result)
}
t2<-
mcor<-cor(t2,use= "pairwise.complete.obs")
str(mtcars)
round(t1,digits = 2)
library(corrplot)
col<-colorRampPalette(c("#BB4444","#EE9988","#FFFFFF","#77AADD","#4477AA"))
png("sp28_cor_fpc.png",width = 1000,height = 1000)
corrplot(mcor,type=c("lower"),method="shade",shade.col = NA, tl.col="black",tl.srt=0,
         col=col(200),order="FPC",addCoef.col = "black")
dev.off()

r[is.na(r)]<-min(t$psm[t$psm>0])*0.01
r[r==0]<-min(t$psm[t$psm>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_28.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S28")
dev.off()
