a1<-read.table("abc.txt",header = T, sep = "\t")
a2<-read.table("trap.txt",header = T, sep = "\t")
a3<-read.table("ttt.txt",header = T, sep = "\t")
at<-read.table("tonb.txt",header = T, sep = "\t")
a11<-subset(a1,Species!=""&Species!="Archaea")
a22<-subset(a2,Species!=""&Species!="Archaea")
a33<-subset(a3,Species!=""&Species!="Archaea")
att<-subset(at,Species!=""&Species!="Eukaryota"&Species!="Viruses")
library(dplyr)

a111<-a11 %>% group_by(Species) %>% 
  summarise(sum(iBAQ_08),sum(iBAQ_10),sum(iBAQ_12),sum(iBAQ_14),sum(iBAQ_16),sum(iBAQ_18),sum(iBAQ_20),sum(iBAQ_22),sum(iBAQ_24),sum(iBAQ_26),sum(iBAQ_28))
colnames(a111)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
a111$Type<-rep("ABC type",1)
a222<-a22 %>% group_by(Species) %>% 
  summarise(sum(iBAQ_08),sum(iBAQ_10),sum(iBAQ_12),sum(iBAQ_14),sum(iBAQ_16),sum(iBAQ_18),sum(iBAQ_20),sum(iBAQ_22),sum(iBAQ_24),sum(iBAQ_26),sum(iBAQ_28))
colnames(a222)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
a222$Type<-rep("TRAP type",1)
a333<-a33 %>% group_by(Species) %>% 
  summarise(sum(iBAQ_08),sum(iBAQ_10),sum(iBAQ_12),sum(iBAQ_14),sum(iBAQ_16),sum(iBAQ_18),sum(iBAQ_20),sum(iBAQ_22),sum(iBAQ_24),sum(iBAQ_26),sum(iBAQ_28))
colnames(a333)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
a333$Type<-rep("TTT type",1)

attt<-att %>% group_by(Species) %>% 
  summarise(sum(iBAQ_08),sum(iBAQ_10),sum(iBAQ_12),sum(iBAQ_14),sum(iBAQ_16),sum(iBAQ_18),sum(iBAQ_20),sum(iBAQ_22),sum(iBAQ_24),sum(iBAQ_26),sum(iBAQ_28))
colnames(attt)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
attt$Type<-rep("TonB type",1)
a4<-rbind(a111,a222,a333,attt)
#分面的条形图
a4_1<-melt(a4,id=c("Species","Type"))
colnames(a4_1)<-c("Species","Type","Samples","Abundance")
ggplot(a4_1,aes(x=Species,y=Abundance,fill=Species))+geom_bar(stat="identity")+
  facet_grid(Type ~ Samples,scales = "free")+
  theme(axis.text.x = element_blank(),axis.ticks = element_blank(),axis.title.x = element_blank())
library(reshape2)
a44<-melt(a4,id=c("Species","Type"))
colnames(a44)<-c("Species","Type","Samples","Abundance")
ggplot(a44,aes(x=Samples,y=Abundance,fill=Type))+geom_bar(position="dodge",stat="identity")
ggplot(a44,aes(x=Species,y=Abundance,fill=Species))+geom_bar(position="dodge",stat="identity")
ggplot(a44,aes(x=Type,y=Abundance,fill=Species))+geom_boxplot()
a44_abc<-filter(a44,Type=="ABC type")
a44_trap<-filter(a44,Type=="TRAP type")
a44_ttt<-filter(a44,Type=="TTT type")
a44_ton<-filter(a44,Type=="TonB type")
ggplot(a44_abc,aes(x=Species,y=Abundance,fill=Species))+geom_boxplot()+xlab("ABC transport")+theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,family = "Times",face="italic",colour="darkred",size=rel(0.9)))
ggplot(a44_trap,aes(x=Species,y=Abundance,fill=Species))+geom_boxplot()+xlab("TRAP transport")+theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,family = "Times",face="italic",colour="darkred",size=rel(0.9)))
ggplot(a44_ttt,aes(x=Species,y=Abundance,fill=Species))+geom_boxplot()+xlab("TTT transport")+theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,family = "Times",face="italic",colour="darkred",size=rel(0.9)))
ggplot(a44_ton,aes(x=Species,y=Abundance,fill=Species))+geom_boxplot()+xlab("TonB transport")+theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,family = "Times",face="italic",colour="darkred",size=rel(0.9)))

#ggplot(a44_abc,aes(x=Species,y=Abundance,fill=Species))+geom_violin()
a5<-a4 %>% group_by(Type) %>% 
  summarise(sum(S08),sum(S10),sum(S12),sum(S14),sum(S16),sum(S18),sum(S20),sum(S22),sum(S24),sum(S26),sum(S28))
colnames(a5)<-c("Type","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
a55<-melt(a5,id="Type")
colnames(a55)<-c("Type","Samples","Abundance")
ggplot(a55,aes(x=Type,y=Abundance,fill=Type))+geom_boxplot()
