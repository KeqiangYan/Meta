t<-read.table("26I_S8_cog.txt.fam.4.cogid.out",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$iBAQ[t$iBAQ>0])*0.01
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_8.png",width = 500,height = 1000)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S8")
dev.off()

t<-read.table("26I_S10_cog.txt.fam.4.cogid.out",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$iBAQ[t$iBAQ>0])*0.01
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_10.png",width = 500,height = 1000)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S10")
dev.off()

t<-read.table("26I_S12_cog.txt.fam.4.cogid.out",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$iBAQ[t$iBAQ>0])*0.01
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_12.png",width = 500,height = 1000)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S12")
dev.off()

t<-read.table("26I_S14_cog.txt.fam.4.cogid.out",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$iBAQ[t$iBAQ>0])*0.01
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_14.png",width = 500,height = 1000)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S14")
dev.off()

t<-read.table("26I_S16_cog.txt.fam.4.cogid.out",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$iBAQ[t$iBAQ>0])*0.01
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_16.png",width = 500,height = 1000)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S16")
dev.off()

t<-read.table("26I_S18_cog.txt.fam.4.cogid.out",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$iBAQ[t$iBAQ>0])*0.01
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_18.png",width = 500,height = 1000)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S18")
dev.off()

t<-read.table("26I_S20_cog.txt.fam.4.cogid.out",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$iBAQ[t$iBAQ>0])*0.01
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_20.png",width = 500,height = 1000)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S20")
dev.off()

t<-read.table("26I_S22_cog.txt.fam.4.cogid.out",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$iBAQ[t$iBAQ>0])*0.01
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_22.png",width = 500,height = 1000)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S22")
dev.off()

t<-read.table("26I_S24_cog.txt.fam.4.cogid.out",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$iBAQ[t$iBAQ>0])*0.01
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_24.png",width = 500,height = 1000)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S24")
dev.off()

t<-read.table("26I_S26_cog.txt.fam.4.cogid.out",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$iBAQ[t$iBAQ>0])*0.01
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_26.png",width = 500,height = 1000)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S26")
dev.off()

t<-read.table("26I_S28_cog.txt.fam.4.cogid.out",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$iBAQ[t$iBAQ>0])*0.01
r[r==0]<-min(t$iBAQ[t$iBAQ>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_28.png",width = 500,height = 1000)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S28")
dev.off()