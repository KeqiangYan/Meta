g1<-read.table("function_analysis",header = T, sep = "\t",quote = "")
library(dplyr)
g2<-filter(g1,COG.ID!="-")
g2<-dplyr::select(g2,iBAQ_08:COG.Function.Description)
colnames(g2)<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28","COG","Def")
g3<-g2 %>% group_by(COG) %>% 
  summarise(sum(S08),sum(S10),sum(S12),sum(S14),sum(S16),sum(S18),sum(S20),sum(S22),sum(S24),sum(S26),sum(S28))
colnames(g3)<-c("COG","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
#chaperone analysis
cha1<-filter(g3,COG=="COG0071")%>%dplyr::select(S08:S28)%>%as.numeric()
cha2<-filter(g3,COG=="COG0234")%>%dplyr::select(S08:S28)%>%as.numeric()
cha3<-filter(g3,COG=="COG0326")%>%dplyr::select(S08:S28)%>%as.numeric()
cha4<-filter(g3,COG=="COG0443")%>%dplyr::select(S08:S28)%>%as.numeric()
cha5<-filter(g3,COG=="COG0459")%>%dplyr::select(S08:S28)%>%as.numeric()
cha6<-filter(g3,COG=="COG0484")%>%dplyr::select(S08:S28)%>%as.numeric()
cha7<-filter(g3,COG=="COG0576")%>%dplyr::select(S08:S28)%>%as.numeric()
cha8<-filter(g3,COG=="COG1952")%>%dplyr::select(S08:S28)%>%as.numeric()
cha9<-filter(g3,COG=="COG2214")%>%dplyr::select(S08:S28)%>%as.numeric()
tem
cor.test(tem,cha1)
cor.test(tem,cha2)
cor.test(tem,cha3)
cor.test(tem,cha4)
cor.test(tem,cha5)
cor.test(tem,cha6)
cor.test(tem,cha7)
cor.test(tem,cha8)
cor.test(tem,cha9)
cha<-data.frame(cha1,cha2,cha3,cha4,cha5,cha6,cha7,cha8,cha9)
cha$sum<-apply(cha,1,sum)
ch3<-cha[,c(1,4,5)]
ch3$sum<-apply(ch3,1,sum)
cor.test(tem,cha$sum)
cor.test(tem,ch3$sum)
g3$count<-apply(g3[-1],1,f)
g4_0<-filter(g3,count==0)
#用没有缺失值的功能去验证，发现仍没有显著差异的蛋白功能，这条路可能走不通。。。
g4_0$pvalue <- NA
g4_0$qvalue<-NA
for (i in 1:nrow(g4_0)){
  x1<-as.numeric(as.vector(as.matrix(g4_0[i,2:6])))
  y1<-as.numeric(as.vector(as.matrix(g4_0[i,7:12])))
  value<-wilcox.test(x1,y1)
  g4_0$pvalue[i]<- value$p.value
}
library(qvalue)
g4_0$qvalue<-qvalue(g4_0$pvalue)$qvalues

g3$aa<-p.adjust(g3$pvalue,method="fdr",n=length(g3$pvalue))
g3$aa<-p.adjust(g3$pvalue,method="BH",n=length(g3$pvalue))
gt<-g3[1:5,1:13]
f<-function(x){
  sum(x==0)
}
##相关性分析
COG<-g4_0$COG
g41<-g4_0[1:12]
g5<-t(g41)
colnames(g5)<-COG
env<-read.csv("t1.csv",header = T)

Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
g5<-data.frame(g41,row.names = 1)
g55<-t(g5)
g555<-as.data.frame(g55,row.names = F)
g5555<-as.data.frame(cbind(Sample,g555))
row.names(g5555)<-g5555[,1]
g5555<-g5555[,-1]
g5555$S<-c(33.66163,34.09648,34.18657,34.22078,34.65462,34.86894,34.82082,34.60861,35.8406,35.95279,36.1751)
ct<-corr.test(g5555[1:546],g5555[547])
