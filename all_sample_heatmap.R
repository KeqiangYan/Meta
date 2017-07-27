h<-read.table("all_sample_iBAQ.txt.0.filter",header = T,sep = "\t")
row.names(h)<-h[,1]
h<-h[,-1]
h[h==0]<-min(h[h>0])*0.01
h1=-log10(h)
h1_matrix<-as.matrix(h1)
library(pheatmap)
heatmap1<-pheatmap(h1_matrix)
pheatmap2 <- pheatmap(mat = h1_matrix, color = colorRampPalette(c("red","black", "green"))(256), border_color = NA, cluster_rows = T, cluster_cols = T,show_rownames = T, show_colnames = T, fontsize_col = 5)
#color <- c(colorRampPalette(c("blue", "white"))(256), colorRampPalette(c("white", "red"))(256)) 
#pheatmap(mat = h1_matrix, color = color, border_color = NA, scale = "row", cluster_rows = T, cluster_cols = T,show_rownames = F, show_colnames = T, fontsize_col = 5)
h<-read.table("all_sample_iBAQ.txt.11.filter",header = T,sep = "\t")
row.names(h)<-h[,1]
h<-h[,-1]
h[h==0]<-min(h[h>0])*0.01
h1=-log10(h)
h1_matrix<-as.matrix(h1)
library(pheatmap)
heatmap1<-pheatmap(h1_matrix)
pheatmap2 <- pheatmap(mat = h1_matrix, color = colorRampPalette(c("red","black", "green"))(256), border_color = NA, cluster_rows = T, cluster_cols = T,show_rownames = F, show_colnames = T, fontsize_col = 5)
