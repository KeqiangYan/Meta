s1<-read.table("Syne1.txt",header = T,sep="\t")
library(dplyr)
library(magrittr)
s11<-s1 %>% group_by(COG.ID)%>%summarise(sum(iBAQ_08),sum(iBAQ_10),sum(iBAQ_12),sum(iBAQ_14),sum(iBAQ_16),sum(iBAQ_18),sum(iBAQ_20),sum(iBAQ_22),sum(iBAQ_24),sum(iBAQ_26),sum(iBAQ_28))
colnames(s11)<-c("COG","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
#进行归一化，物种层面
s11<-mutate(s11,per_S08=S08/sum(S08),per_S10=S10/sum(S10),per_S12=S12/sum(S12),per_S14=S14/sum(S14),per_S16=S16/sum(S16),per_S18=S18/sum(S18),per_S20=S20/sum(S20),per_S22=S22/sum(S22),per_S24=S24/sum(S24),per_S26=S26/sum(S26),per_S28=S28/sum(S28))
s111<-dplyr::select(s11,COG,per_S08:per_S28)
s1111<-filter(s111,per_S08>=0.01|per_S10>=0.01|per_S12>=0.01|per_S14>=0.01|per_S16>=0.01|per_S18>=0.01|per_S20>=0.01|per_S22>=0.01|per_S24>=0.01|per_S26>=0.01|per_S28>=0.01)
s11111<-s1111[-1,]
s11111$COG<-as.vector(s11111$COG)
s11111<-as.data.frame(s11111)
row.names(s11111)<-s11111[,1]
s11111<-s11111[,-1]
r<-s11111
#r[is.na(r)]<-min(t$psm[t$psm>0])*0.01
r[r==0]<-min(r[r!=0])*0.01
r1<-log10(r)
library(pheatmap)
png("heatmap_28.png",width = 650,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "Proch_COG")
dev.off()
#不进行归一化结果
s111<-filter(s11,S08>=0.001|S10>=0.001|S12>=0.001|S14>=0.001|S16>=0.001|S18>=0.001|S20>=0.001|S22>=0.001|S24>=0.001|S26>=0.001|S28>=0.001)

s1111<-s111[-1,]
s1111$COG<-as.vector(s1111$COG)
s1111<-as.data.frame(s1111)
row.names(s1111)<-s1111[,1]
s1111<-s1111[,-1]
r<-s1111
#r[is.na(r)]<-min(t$psm[t$psm>0])*0.01
r[r==0]<-min(r[r!=0])*0.01
r1<-log10(r)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = T, cluster_cols = T,cutree_cols = 2,annotation_legend = TRUE,color = colorRampPalette(c("white", "brown", "black"))(50),cellwidth = 30, cellheight = 12, main = "Proch_COG")
