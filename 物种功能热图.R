t<-read.table("26I_S8.txt",header=T,sep = "\t")
library(reshape2)
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_8.png",width = 800,height = 600)
pheatmap(r1,show_rownames = T,show_colnames = T, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 16, cellheight = 10, main = "S8")
dev.off()

t<-read.table("26I_S10.txt",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_10.png",width = 800,height = 600)
pheatmap(r1,show_rownames = T,show_colnames = T, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 16, cellheight = 10, main = "S10")
dev.off()

t<-read.table("26I_S12.txt",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_12.png",width = 800,height = 600)
pheatmap(r1,show_rownames = T,show_colnames = T, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 16, cellheight = 10, main = "S12")
dev.off()

t<-read.table("26I_S14.txt",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_14.png",width = 800,height = 600)
pheatmap(r1,show_rownames = T,show_colnames = T, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 16, cellheight = 10, main = "S14")
dev.off()

t<-read.table("26I_S16.txt",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_16.png",width = 800,height = 600)
pheatmap(r1,show_rownames = T,show_colnames = T, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 16, cellheight = 10, main = "S16")
dev.off()

t<-read.table("26I_S18.txt",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_18.png",width = 800,height = 600)
pheatmap(r1,show_rownames = T,show_colnames = T, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 16, cellheight = 10, main = "S18")
dev.off()

t<-read.table("26I_S20.txt",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_20.png",width = 800,height = 600)
pheatmap(r1,show_rownames = T,show_colnames = T, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 16, cellheight = 10, main = "S20")
dev.off()

t<-read.table("26I_S22.txt",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_22.png",width = 800,height = 600)
pheatmap(r1,show_rownames = T,show_colnames = T, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 16, cellheight = 10, main = "S22")
dev.off()

t<-read.table("26I_S24.txt",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_24.png",width = 800,height = 600)
pheatmap(r1,show_rownames = T,show_colnames = T, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 16, cellheight = 10, main = "S24")
dev.off()

t<-read.table("26I_S26.txt",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_26.png",width = 800,height = 600)
pheatmap(r1,show_rownames = T,show_colnames = T, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 16, cellheight = 10, main = "S26")
dev.off()

t<-read.table("26I_S28.txt",header=T,sep = "\t")
r<-dcast(t,Code~Taxonomy)
row.names(r)<-r[,1]
r<-r[,-1]
r[is.na(r)]<-min(t$Abundance[t$Abundance>0])*0.01
r[r==0]<-min(t$Abundance[t$Abundance>0])*0.01
r1<-log10(r)
png("heatmap_28.png",width = 800,height = 600)
pheatmap(r1,show_rownames = T,show_colnames = T, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 16, cellheight = 10, main = "S28")
dev.off()