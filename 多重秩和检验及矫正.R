gos<-read.table("value.txt",header = T, sep = "\t")
gos$pvalue <- 0.01
for (i in 1:nrow(gos)){
  x1<-as.numeric(as.vector(as.matrix(gos[i,2:6])))
  y1<-as.numeric(as.vector(as.matrix(gos[i,7:12])))
  value<-wilcox.test(x1,y1)
  gos$pvalue[i]<- value$p.value
}
gos1<-subset(gos,pvalue<0.01)
library(qvalue)
data(hedenfalk)
length(hedenfalk)
a<-qvalue(gos$pvalue)
gos$qvalue<-a$qvalues
gos$pvaluee<-a$pvalues
aa<-p.adjust(gos$pvalue,method="fdr",n=length(gos$pvalue))
aa<-p.adjust(gos$pvalue,method="BH",n=length(gos$pvalue))
gos$pvaluee<-aa
gos[1,2:6]
x1<-as.numeric(as.vector(as.matqrix(gos[1,2:6])))
sum(x1
    )

