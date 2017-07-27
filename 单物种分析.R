library(reshape2)
t8<-read.table("26I_S8.txt",header=T,sep = "\t")
r8<-dcast(t8,Code~Taxonomy)
b8<-subset(r8,select=c(Code,`Actinobacteria <phylum>`))
names(b8)<-c("Code","S8")
t10<-read.table("26I_S10.txt",header=T,sep = "\t")
r10<-dcast(t10,Code~Taxonomy)
b10<-subset(r10,select=c(Code,`Actinobacteria <phylum>`))
names(b10)<-c("Code","S10")
t12<-read.table("26I_S12.txt",header=T,sep = "\t")
r12<-dcast(t12,Code~Taxonomy)
b12<-subset(r12,select=c(Code,`Actinobacteria <phylum>`))
names(b12)<-c("Code","S12")
t14<-read.table("26I_S14.txt",header=T,sep = "\t")
r14<-dcast(t14,Code~Taxonomy)
b14<-subset(r14,select=c(Code,`Actinobacteria <phylum>`))
names(b14)<-c("Code","S14")
t16<-read.table("26I_S16.txt",header=T,sep = "\t")
r16<-dcast(t16,Code~Taxonomy)
b16<-subset(r16,select=c(Code,`Actinobacteria <phylum>`))
names(b16)<-c("Code","S16")
t18<-read.table("26I_S18.txt",header=T,sep = "\t")
r18<-dcast(t18,Code~Taxonomy)
b18<-subset(r18,select=c(Code,`Actinobacteria <phylum>`))
names(b18)<-c("Code","S18")
t20<-read.table("26I_S20.txt",header=T,sep = "\t")
r20<-dcast(t20,Code~Taxonomy)
b20<-subset(r20,select=c(Code,`Actinobacteria <phylum>`))
names(b20)<-c("Code","S20")
t22<-read.table("26I_S22.txt",header=T,sep = "\t")
r22<-dcast(t22,Code~Taxonomy)
b22<-subset(r22,select=c(Code,`Actinobacteria <phylum>`))
names(b22)<-c("Code","S22")
t24<-read.table("26I_S24.txt",header=T,sep = "\t")
r24<-dcast(t24,Code~Taxonomy)
b24<-subset(r24,select=c(Code,`Actinobacteria <phylum>`))
names(b24)<-c("Code","S24")
t26<-read.table("26I_S26.txt",header=T,sep = "\t")
r26<-dcast(t26,Code~Taxonomy)
b26<-subset(r26,select=c(Code,`Actinobacteria <phylum>`))
names(b26)<-c("Code","S26")
t28<-read.table("26I_S28.txt",header=T,sep = "\t")
r28<-dcast(t28,Code~Taxonomy)
b28<-subset(r28,select=c(Code,`Actinobacteria <phylum>`))
names(b28)<-c("Code","S28")

#º¯Êýmultimerge
multimerge<-function(dat=list(),...){
  if(length(dat)<2)return(as.data.frame(dat))
  mergedat<-dat[[1]]
  dat[[1]]<-NULL
  for(i in dat){
    mergedat<-merge(mergedat,i,...,all=T)
  }
  return(mergedat)
}

c<-multimerge(list(b8,b10,b12,b14,b16,b18,b20,b22,b24,b26,b28))
names(c)<-c("Code","S8","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
c[is.na(c)]<-0
#heatmap

row.names(c)<-c[,1]
c<-c[,-1]
c[c==0]<-min(c[c>0])*0.01
r1<-log10(c)
library(pheatmap)
png("Actinobacteria.png",width = 500,height = 500)
pheatmap(r1,show_rownames = TRUE,show_colnames = TRUE, cluster_rows = F, cluster_cols = T,color = colorRampPalette(c("white", "steelblue", "black"))(50),cellwidth = 36, cellheight = 16, main = "Actinobacteria")
dev.off()