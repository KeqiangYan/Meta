d<-read.table("all_uniq_sc.txt",header = T,sep = "\t")
library(ggplot2)
font<-"Times New Roman"
stat <- as.data.frame(table(cut(d$Unique.peptides, breaks = c(0:10,Inf))))
colnames(stat)<-c("UniquePeptideNumber","Count")
stat$UniquePeptideNumber<-c("1","2","3","4","5","6","7","8","9","10",">=11")
stat$UniquePeptideNumber=factor(stat$UniquePeptideNumber,levels=stat$UniquePeptideNumber,order=TRUE)
p<-ggplot(stat, aes(x = UniquePeptideNumber, y = Count,fill=Count)) + geom_bar(position='dodge',stat = "identity")+geom_text(aes(label=Count), position=position_dodge(width=0.9),vjust=0.5,hjust=-0.1,angle=90,size=4)+theme_bw()+theme(axis.title=element_text(face="bold"))+ylim(0,max(max(stat$Count)*1.2))+xlab("Unique peptide number")+ylab("Protein count")
ggsave(filename="PepNumStat.png",device="png",width=7,height=5,plot=p,dpi=100)

stat <- as.data.frame(table(cut(d$MS.MS.Count, breaks = c(0,1,2,3,4,5,10,15,20,25,30,35,40,Inf))))
colnames(stat)<-c("UniqueSpecNumber","Count")
p<-ggplot(stat, aes(x = UniqueSpecNumber, y = Count,fill=Count)) + geom_bar(position='dodge',stat = "identity")+geom_text(aes(label=Count), position=position_dodge(width=0.9), vjust=0.5,hjust=-0.1,angle=90,size=4)+theme_bw()+theme(axis.title=element_text(face="bold"),axis.text.x=element_text(angle=90))+ylim(0,max(max(stat$Count)*1.2))+xlab("Unique spectrum number")+ylab("Protein count")
ggsave(filename="SpecNumStat.png",device="png",width=7,height=5,plot=p,dpi=100)
