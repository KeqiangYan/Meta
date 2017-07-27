m<-read.table("sample correlation.txt",header = T,sep = "\t")
cor.test(m$Syne,m$phycobilisome)
cor.test(m$Syne,m$Chla)
