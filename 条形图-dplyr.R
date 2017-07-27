id <- read.table("id_frequcncy_gos.txt",header = F)
id <-data.frame(id)
colnames(id)<-c("Protein_number","Frequency")
id$Sequence<-id$Protein_number*id$Frequency
id$percent<-id$Sequence/sum(id$Sequence)*100
id$group[id$Protein_number==1] <-"1"
id$group[id$Protein_number==2] <-"2"
id$group[id$Protein_number==3] <-"3"
id$group[id$Protein_number>3& id$Protein_number<11] <-"4-10"
id$group[id$Protein_number<101&id$Protein_number>10] <-"10-100"
id$group[id$Protein_number>100] <-">100"
library(dplyr)
filter(id,id$Protein_number==4)
slice(id,1:4)
newid<-select(id,group,percent)
by_group<-group_by(newid,group)
t<-summarise(by_group,Percent=sum(percent,na.rm = TRUE))
t$group<-factor(t$group,order=TRUE,levels = c("1","2","3","4-10","10-100",">100"))
t$Percent<-round(t$Percent,2)
t$Percent<-paste(t$Percent,"%",sep = " ")
ggplot(t,aes(x=group,y=Percent))+geom_bar(stat = "identity",fill = 'steelblue')+
        geom_text(mapping = aes(label=t$Percent),vjust= -0.5)+xlab("Sequence number of each peptide")
