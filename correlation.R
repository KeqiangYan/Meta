a<-c(100,110,120,139)
b<-c(11,11,12,13)
cor.test(a,b,method="pearson")
cor.test(a,b,method="spearman")
cor.test(a,b,method="kendall")
