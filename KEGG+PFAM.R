d<-read.table("Pfam_WGS_top20.txt",header = T,sep = "\t")
library(ggplot2)
font<-"Times New Roman"

ggplot(d, aes(x = reorder(Pfam,-Protein_number), y = Protein_number,fill=-Protein_number))+ 
  geom_text(aes(label=Protein_number), position=position_dodge(width=0.9),vjust=0.5,hjust=-0.1,angle=0,size=4)+
  theme_bw()+theme(axis.title=element_text(face="bold"))+ylim(0,max(max(d$Protein_number)*1.2))+
  guides(fill=guide_legend(title=NULL))+
  geom_bar(position='identity',stat = "identity")+coord_flip()+xlab("Pfam")+ylab("Protein number")

d1<-read.table("WGS_kegg.txt",header = T,sep = "\t")
colnames(d1)<-c("Pathway","Protein_number")
ggplot(d1, aes(x = reorder(Pathway,-Protein_number), y = Protein_number,fill=-Protein_number))+ 
  geom_text(aes(label=Protein_number), position=position_dodge(width=0.9),vjust=0.5,hjust=-0.1,angle=0,size=4)+
  theme_bw()+theme(axis.title=element_text(face="bold"))+ylim(0,max(max(d1$Protein_number)*1.2))+
  guides(fill=guide_legend(title=NULL))+
  geom_bar(position='identity',stat = "identity")+coord_flip()+xlab("Pathway")+ylab("Protein number")
