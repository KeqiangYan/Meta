a1<-read.table("0683a.txt",header = T, sep = "\t")
a2<-read.table("0683b.txt",header = T, sep = "\t")
a3<-read.table("abc_trap.txt",header = T, sep = "\t")
a11<-subset(a1,Species!="")
a22<-subset(a2,Species!="")
a33<-subset(a3,Species!=""&Species!="Archaea")
#library(dplyr)
a111<-a11 %>% group_by(Species) %>% 
  summarise(sum(iBAQ_08),sum(iBAQ_10),sum(iBAQ_12),sum(iBAQ_14),sum(iBAQ_16),sum(iBAQ_18),sum(iBAQ_20),sum(iBAQ_22),sum(iBAQ_24),sum(iBAQ_26),sum(iBAQ_28))

colnames(a111)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
a111$group<-rep("Branched-chain amino acid",1)
a222<-a22 %>% group_by(Species) %>% 
  summarise(sum(iBAQ_08),sum(iBAQ_10),sum(iBAQ_12),sum(iBAQ_14),sum(iBAQ_16),sum(iBAQ_18),sum(iBAQ_20),sum(iBAQ_22),sum(iBAQ_24),sum(iBAQ_26),sum(iBAQ_28))
colnames(a222)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
a222$group<-rep("Urea",1)

y<-c("COG.ID","Species")
dots<-sapply(y, . %>% {as.formula(paste0('~', .))}) #dots<-list(~COG.ID,~Species)
a333<-a33 %>% group_by_(.dots=dots) %>% 
  summarise(sum(iBAQ_08),sum(iBAQ_10),sum(iBAQ_12),sum(iBAQ_14),sum(iBAQ_16),sum(iBAQ_18),sum(iBAQ_20),sum(iBAQ_22),sum(iBAQ_24),sum(iBAQ_26),sum(iBAQ_28))
colnames(a333)<-c("COG","Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
a333$group<-NA
for (i in 1:nrow(a333)){
  if (a333[i,1]=="COG0226"||a333[i,1]=="COG3221"){
    a333[i,14]<-"Phosphate"
  }
  else if (a333[i,1]=="COG0614"||a333[i,1]=="COG0803"||a333[i,1]=="COG1840"||a333[i,1]=="COG4531"){
    a333[i,14]<-"Metal ion"
  }
  else if (a333[i,1]=="COG1653"||a333[i,1]=="COG1879"||a333[i,1]=="COG4213"){
    a333[i,14]<-"Sugar"
  }
  else if (a333[i,1]=="COG2113"||a333[i,1]=="COG0834"){
    a333[i,14]<-"Amino acid"
  }
  else if (a333[i,1]=="COG0715"){
    a333[i,14]<-"nitrate/sulfonate/bicarbonate"
  }
  else if (a333[i,1]=="COG0747"){
    a333[i,14]<-"dipeptide/nickel"
  }
  else if (a333[i,1]=="COG4521"){
    a333[i,14]<-"taurine"
  }
  else if (a333[i,1]=="COG4143"){
    a333[i,14]<-"thiamine"
  }
  else if (a333[i,1]=="COG4166"){
    a333[i,14]<-"oligopeptide"
  }
  else if (a333[i,1]=="COG4663"){
    a333[i,14]<-"mannitol/chloroaromatic compound"
  }
  else if (a333[i,1]=="COG1638"){
    a333[i,14]<-"C4-dicarboxylate"
  }
  else if (a333[i,1]=="COG2358"){
    a333[i,14]<-"glutamate"
  }
}
a3333<-a333[,-1]
a4<-rbind(a3333,a222,a111)

library(reshape2)
a44<-melt(a4,id=c("Species","group"))
colnames(a44)<-c("Species","Group","Samples","Abundance")
library(ggplot2)
ggplot(a44,aes(x=Group,y=Abundance,fill=Group))+geom_bar(stat="identity")+theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))
ggplot(a44,aes(x=Samples,y=Abundance,fill=Group))+geom_bar(position="dodge",stat="identity")
ggplot(a44,aes(x=Species,y=Abundance,fill=Species))+geom_bar(position="dodge",stat="identity")
ggplot(a44,aes(x=Group,y=Abundance,fill=Group))+geom_boxplot()
#fen yang ben zuo ba tu
cb_palette <-c("#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#BB4444","#7777DD","#CC6666","#4477AA","#CCEEFF","#FFDDDD")
png("s8.png",width = 600,height = 700)
s8<-select(a4,Species,S08,group)
s8<-filter(s8,S08 != 0)
ggplot(s8,aes(x=group,y=S08,fill=Species))+geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))+
  scale_fill_manual(values = cb_palette)

png("s10.png",width = 600,height = 700)
S10<-select(a4,Species,S10,group)
S10<-filter(S10,S10 != 0)
ggplot(S10,aes(x=group,y=S10,fill=Species))+geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))+
  scale_fill_manual(values = cb_palette)
dev.off()
png("s12.png",width = 600,height = 700)
S12<-select(a4,Species,S12,group)
S12<-filter(S12,S12 != 0)
ggplot(S12,aes(x=group,y=S12,fill=Species))+geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))+
  scale_fill_manual(values = cb_palette)
dev.off()
png("s14.png",width = 600,height = 700)
S14<-select(a4,Species,S14,group)
S14<-filter(S14,S14 != 0)
ggplot(S14,aes(x=group,y=S14,fill=Species))+geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))+
  scale_fill_manual(values = cb_palette)
dev.off()
png("s16.png",width = 600,height = 700)
S16<-select(a4,Species,S16,group)
S16<-filter(S16,S16 != 0)
ggplot(S16,aes(x=group,y=S16,fill=Species))+geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))+
  scale_fill_manual(values = cb_palette)
dev.off()
png("s18.png",width = 600,height = 700)
s18<-select(a4,Species,S18,group)
s18<-filter(s18,S18 != 0)
ggplot(s18,aes(x=group,y=S18,fill=Species))+geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))+
  scale_fill_manual(values = cb_palette)
dev.off()
png("s20.png",width = 600,height = 700)
S20<-select(a4,Species,S20,group)
S20<-filter(S20,S20 != 0)
ggplot(S20,aes(x=group,y=S20,fill=Species))+geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))+
  scale_fill_manual(values = cb_palette)
dev.off()
png("s22.png",width = 600,height = 700)
S22<-select(a4,Species,S22,group)
S22<-filter(S22,S22 != 0)
ggplot(S22,aes(x=group,y=S22,fill=Species))+geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))+
  scale_fill_manual(values = cb_palette)
dev.off()
png("s24.png",width = 600,height = 700)
S24<-select(a4,Species,S24,group)
S24<-filter(S24,S24 != 0)
ggplot(S24,aes(x=group,y=S24,fill=Species))+geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))+
  scale_fill_manual(values = cb_palette)
dev.off()
png("s26.png",width = 600,height = 700)
s26<-select(a4,Species,S26,group)
s26<-filter(s26,S26 != 0)
ggplot(s26,aes(x=group,y=S26,fill=Species))+geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))+
  scale_fill_manual(values = cb_palette)
dev.off()
png("s28.png",width = 600,height = 700)
s28<-select(a4,Species,S28,group)
s28<-filter(s28,S28 != 0)
ggplot(s28,aes(x=group,y=S28,fill=Species))+geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))+
  scale_fill_manual(values = cb_palette)
dev.off()


#将a44数据分成6个面去整理，样本按东西样本分类，物种按丰度高低进行分类。分为b1,b2,b3,b4,b5,b6
b1<-select(a4,Species:S16,group)
b11<-filter(b1,Species=="Alphaproteobacteria"|Species=="Betaproteobacteria"|Species=="Gammaproteobacteria"|Species=="delta/epsilon subdivisions")
b111<-melt(b11,id=c("Species","group"))
colnames(b111)<-c("Species","Group","Samples","Abundance")
ggplot(b111,aes(x=Group,y=Abundance,fill=Group))+geom_bar(stat="identity")+
  facet_grid(Species ~ Samples)+
  theme(axis.text.x = element_blank(),axis.ticks = element_blank(),axis.title.x = element_blank())

b2<-select(a4,Species:S16,group)
b22<-filter(b2,Species=="Cyanobacteria"|Species=="Actinobacteria <phylum>"|Species==" Proteobacteria"|Species==" Bacteria")
b222<-melt(b22,id=c("Species","group"))
colnames(b222)<-c("Species","Group","Samples","Abundance")
ggplot(b222,aes(x=Group,y=Abundance,fill=Group))+geom_bar(stat="identity")+
  facet_grid(Species ~ Samples,scale="free")+
  theme(axis.text.x = element_blank(),axis.ticks = element_blank(),axis.title.x = element_blank())

b3<-select(a4,Species,S18:group)
b33<-filter(b3,Species=="Alphaproteobacteria"|Species=="Betaproteobacteria"|Species=="Gammaproteobacteria"|Species=="delta/epsilon subdivisions")
b333<-melt(b33,id=c("Species","group"))
colnames(b333)<-c("Species","Group","Samples","Abundance")
ggplot(b333,aes(x=reorder(Group,-Abundance),y=Abundance,fill=Group))+geom_bar(stat="identity")+
  facet_grid(Species ~ Samples,scales = "free")+
  theme(axis.text.x = element_blank(),axis.ticks = element_blank(),axis.title.x = element_blank())

b4<-select(a4,Species,S18:group)
b44<-filter(b4,Species=="Cyanobacteria"|Species=="PVC group"|Species=="Actinobacteria <phylum>"|Species=="Firmicutes")
b444<-melt(b44,id=c("Species","group"))
colnames(b444)<-c("Species","Group","Samples","Abundance")
ggplot(b444,aes(x=reorder(Group,-Abundance),y=Abundance,fill=Group))+geom_bar(stat="identity")+
  facet_grid(Species ~ Samples,scales = "free")+
  theme(axis.text.x = element_blank(),axis.ticks = element_blank(),axis.title.x = element_blank())

b5<-filter(a4,Species=="Alphaproteobacteria"|Species=="Betaproteobacteria"|Species=="Gammaproteobacteria"|Species=="delta/epsilon subdivisions")
b55<-melt(b5,id=c("Species","group"))
colnames(b55)<-c("Species","Group","Samples","Abundance")
ggplot(b55,aes(x= Group,y=Abundance,fill=Group))+geom_bar(stat="identity")+
  facet_grid(Species ~ Samples,scales = "free")+
  theme(axis.text.x = element_blank(),axis.ticks = element_blank(),axis.title.x = element_blank())


b6<-filter(a4,Species=="Cyanobacteria"|Species=="Actinobacteria <phylum>"|Species==" Proteobacteria"|Species==" Bacteria")
b66<-melt(b6,id=c("Species","group"))
colnames(b66)<-c("Species","Group","Samples","Abundance")
ggplot(b66,aes(x=Group,y=Abundance,fill=Group))+geom_bar(stat="identity")+
  facet_grid(Species ~ Samples,scales = "free")+
  theme(axis.text.x = element_blank(),axis.ticks = element_blank(),axis.title.x = element_blank())


#根据每个物种去做箱线图，描绘每个物种信息，共7个物种
a44$Type<-NA
for (i in 1:nrow(a44)){
  if (a44[i,2]=="Phosphate"||a44[i,2]=="Metal ion"||a44[i,2]=="nitrate/sulfonate/bicarbonate"){
    a44[i,5]<-"ABC inorganics"
  }
  else if (a44[i,2]=="dipeptide/nickel"||a44[i,2]=="Amino acid"||a44[i,2]=="Sugar"||a44[i,2]=="Urea"||a44[i,2]=="taurine"||a44[i,2]=="thiamine"||a44[i,2]=="Branched-chain amino acid"||a44[i,2]=="oligopeptide"){
    a44[i,5]<-"ABC organics"
  }
  else {
    a44[i,5]<-"TRAP type"
  }
}

png("Alphaproteobacteria.png",width = 600,height = 700)
c1<-filter(a44,Species=="Alphaproteobacteria")
ggplot(c1,aes(x=Group,y=Abundance,fill=Type))+geom_boxplot()+xlab("Alphaproteobacteria")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,face = "bold"))
dev.off()
png("Betaproteobacteria.png",width = 600,height = 700)
c1<-filter(a44,Species=="Betaproteobacteria")
ggplot(c1,aes(x=Group,y=Abundance,fill=Type))+geom_boxplot()+xlab("Betaproteobacteria")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,face = "bold"))
dev.off()
png("Cyanobacteria.png",width = 600,height = 700)
c1<-filter(a44,Species=="Cyanobacteria")
ggplot(c1,aes(x=Group,y=Abundance,fill=Type))+geom_boxplot()+xlab("Cyanobacteria")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,face = "bold"))
dev.off()
png("Actinobacteria.png",width = 600,height = 700)
c1<-filter(a44,Species=="Actinobacteria <phylum>")
ggplot(c1,aes(x=Group,y=Abundance,fill=Type))+geom_boxplot()+xlab("Actinobacteria")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,face = "bold"))
dev.off()
png("deltaproteobacteria.png",width = 600,height = 700)
c1<-filter(a44,Species=="delta/epsilon subdivisions")
ggplot(c1,aes(x=Group,y=Abundance,fill=Type))+geom_boxplot()+xlab("deltaproteobacteria")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,face = "bold"))
dev.off()
png("Gammaproteobacteria.png",width = 600,height = 700)
c1<-filter(a44,Species=="Gammaproteobacteria")
ggplot(c1,aes(x=Group,y=Abundance,fill=Type))+geom_boxplot()+xlab("Gammaproteobacteria")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,face = "bold"))
dev.off()
png("PVC group.png",width = 600,height = 700)
c1<-filter(a44,Species=="PVC group")
ggplot(c1,aes(x=Group,y=Abundance,fill=Type))+geom_boxplot()+xlab("PVC group")+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,face = "bold"))
dev.off()

#species and samples
#ggplot(a44_abc,aes(x=Species,y=Abundance,fill=Species))+geom_violin()
a5<-a4 %>% group_by(group) %>% 
  summarise(sum(S08),sum(S10),sum(S12),sum(S14),sum(S16),sum(S18),sum(S20),sum(S22),sum(S24),sum(S26),sum(S28))
colnames(a5)<-c("Group","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
a55<-melt(a5,id="Group")
colnames(a55)<-c("Group","Samples","Abundance")
ggplot(a55,aes(x=Group,y=Abundance,fill=Group))+geom_boxplot()+theme(axis.text.x = element_blank(),axis.ticks = element_blank())
cb_palette <-c("#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2","#D55E00","#CC79A7","#999999","#E69F00","#009E73","#56B4E9","#F0E442","#0072B2")
ggplot(a55,aes(x=reorder(Group,-Abundance),y=Abundance,fill=Group))+geom_bar(stat="identity")+
#  scale_fill_manual(values = cb_palette)+
  theme(axis.text.x = element_text(angle=90,hjust = 1,vjust = 0.5,colour="darkred"))
ggplot(a55,aes(x=reorder(Group,-Abundance),y=Abundance,fill=Group))+geom_bar(stat="identity")+
  facet_grid(. ~ Samples)
