fu<-read.table(file = "PVC.txt",header = T,sep = "\t")
library(ggplot2)
#df<-data.frame(fu)
#sub_dff<-head(df,n=20)
ggplot(fu)+geom_point(aes(size=Protein_number,colour=p_value,x=enrichment_factor,y=Function))+
  theme_bw()+scale_colour_continuous(low="blue",high="red",limits=c(0,0.0005))+
  theme(axis.title=element_text(face="bold",size=13),legend.title=element_text(size=13),legend.text=element_text(size=10),axis.text.y = element_text(size=12,angle=0))+
  scale_size_continuous(range=c(2.5,8))
