t<-read.table("cog_id_S.txt",header=T,sep = "\t")
row.names(t)<-t[,1]
t<-t[,-1]

t[t==0]<-min(t[t>0])*0.01
t1<--log10(t)
library(pheatmap)
png("GOS_COG_TOP20.png",width = 800,height = 900)
#pheatmap(t,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 3,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),
         cellwidth = 30, cellheight = 12, main = "Top 20 COG_GOS")

pheatmap(t,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,annotation_legend = TRUE,color = colorRampPalette(c( "white","steelblue", "black"))(50),
         cellwidth = 30, cellheight = 12, main = "Top 20 COG_WGS")
pheatmap(t,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,annotation_legend = TRUE,color = colorRampPalette(c( "white","steelblue"))(50),
         cellwidth = 30, cellheight = 12, main = "Top 20 COG_WGS_S")
dev.off()
t<-read.table("cog_id.txt",header=T,sep = "\t")
library(reshape2)
te<-melt(t,"COG_ID")
colnames(te)<-c("COG_ID","Samples","Abundance")
library(ggplot2)
ggplot(te,aes(x=COG_ID, y=Abundance, fill=Samples))+geom_bar(stat="identity",width=0.5,position="dodge")
th<-t[c(11,12,13,17,15,20,22,23,26,27,35,36,40,41,19),]
teh<-melt(th,"COG_ID")
colnames(teh)<-c("COG_ID","Samples","Abundance")
cb_palette <-c("#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00")
ggplot(teh,aes(x=COG_ID, y=Abundance, fill=Samples))+geom_bar(stat="identity",width=0.5,position="dodge")
#+scale_fill_manual(values = cb_palette)
tl<-t[-c(11,12,13,17,15,20,22,23,26,27,35,36,40,41,19),]
tel<-melt(tl,"COG_ID")
colnames(tel)<-c("COG_ID","Samples","Abundance")
ggplot(tel,aes(x=COG_ID, y=Abundance, fill=Samples))+geom_bar(stat="identity",width=0.5,position="dodge")
