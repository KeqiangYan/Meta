#根据物种和COG功能做图，单样本。
t<-read.table("26I_S10.tax",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_10.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S10")
dev.off()

t<-read.table("26I_S8.tax",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_8.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S8")
dev.off()

t<-read.table("26I_S12.tax",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_12.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S12")
dev.off()

t<-read.table("26I_S14.tax",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_14.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S14")
dev.off()

t<-read.table("26I_S16.tax",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_16.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S16")
dev.off()

t<-read.table("26I_S18.tax",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_18.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S18")
dev.off()

t<-read.table("26I_S20.tax",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_20.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S20")
dev.off()

t<-read.table("26I_S22.tax",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_22.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S22")
dev.off()

t<-read.table("26I_S24.tax",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_24.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S24")
dev.off()

t<-read.table("26I_S26.tax",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_26.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S26")
dev.off()

t<-read.table("26I_S28.tax",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_28.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "S28")
dev.off()