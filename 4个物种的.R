oth<-read.table("other.cog",header = T, sep = "\t")
Syn<-read.table("Synech.cog",header = T, sep = "\t")
Pro<-read.table("Proch.cog",header = T, sep = "\t")
SAR<-read.table("SAR11.cog",header = T, sep = "\t")
a1<-merge(Syn,Pro,by="COG")
a2<-merge(oth,SAR,by="COG")
a3<-merge(a1,a2,by="COG")
colnames(a3)<-c("COG","Syn","Pro","Other","SAR11")
row.names(a3)<-a3[,1]
a4<-a3[,-1]
a5<-log10(a4)
library(pheatmap)
pheatmap(a5,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,
         cutree_cols = 2,annotation_legend = TRUE,
         color = colorRampPalette(c("white", "brown", "black"))(50),
         cellwidth = 30, cellheight = 12, main = "S10")
b1<-merge(Syn,Pro,by="COG",all = T)
b2<-merge(oth,SAR,by="COG",all=T)
b3<-merge(b1,b2,by="COG",all=T)
write.table(b3,file="4sample.txt",sep = "\t",row.names = F)
colnames(b3)<-c("COG","Syn","Pro","Other","SAR11")
row.names(b3)<-b3[,1]
b4<-b3[,-1]
colnames(b4)<-c("COG","Syn","Pro","Other","SAR11")
b4[is.na(b4)]<-0
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
b5<-log10(b4)
library(pheatmap)
pheatmap(b4,show_rownames = F,show_colnames = T, cluster_rows = T, cluster_cols = T,
         cutree_cols = 2,annotation_legend = F,
         color = colorRampPalette(c("white", "brown", "black"))(50),
         cellwidth = 30, cellheight = 0.5, main = "S8")

colnames(b2)<-c("COG","Other","SAR11")
row.names(b2)<-b2[,1]
b4<-b2[,-1]
b5<-log10(b4)
library(pheatmap)
pheatmap(b5,show_rownames = F,show_colnames = T, cluster_rows = T, cluster_cols = T,
         cutree_cols = 2,annotation_legend = F,
         color = colorRampPalette(c("white", "brown", "black"))(50),
         cellwidth = 30, cellheight = 0.5, main = "S8")
corrplot(b5,method="shade",shade.col = NA, tl.col="black",tl.srt=30,
         col=col(200),order="AOE")
