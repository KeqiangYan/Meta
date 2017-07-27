##生成四个不同的组合

A<- sample(1:1000, 400, replace = FALSE)
B<- sample(1:1000, 600, replace = FALSE)
C<- sample(1:1000, 350, replace = FALSE)
D<- sample(1:1000, 550, replace = FALSE)

oth<-read.table("other.cog",header = T, sep = "\t")
Syn<-read.table("Synech.cog",header = T, sep = "\t")
Pro<-read.table("Proch.cog",header = T, sep = "\t")
SAR<-read.table("SAR11.cog",header = T, sep = "\t")
A<-oth[,1]
A<-as.character(A)
A<-as.character(oth[,1])
B<-as.character(Syn[,1])
C<-as.character(Pro[,1])
D<-as.character(SAR[,1])
##使用venn.diagram功能绘图
library (VennDiagram)
install.packages("VennDiagram")
venn.diagram(x= list(A = A,D = D,B = B,C = C), filename = "My3.png", height = 450, width = 450,resolution =300, 
             imagetype="png", col ="transparent", fill =c("cornflowerblue","green","yellow","darkorchid1"),
             alpha = 0.5, label.col = c("orange", "white","darkorchid4", "white", "white", "white",    "white", "white","darkblue", "white", "white", "white","white", "darkgreen", "white"), 
             cex = 0.45,fontfamily = "serif", fontface = "bold",cat.col =c("darkblue", "darkgreen", "orange","darkorchid4"), 
             cat.cex = 0.45,cat.pos = 0, cat.dist = 0.07,cat.fontfamily = "serif", rotation.degree = 270)
