cog0834<-subset(all,all$Code=="COG0834")
ggplot(cog0834,aes(x=Sample,y=iBAQ,fill=Taxonomy))+geom_bar(stat="identity")+ylab("Abundance")+
  ggtitle("Amino acid_COG0834")+theme(plot.title = element_text(hjust = 0.5, vjust=2.12))
cog0683<-subset(all,all$Code=="COG0683")
ggplot(cog0683,aes(x=Sample,y=iBAQ,fill=Taxonomy))+geom_bar(stat="identity")+ylab("Abundance")+
  ggtitle("Branched-chain amino acid_COG0683")+theme(plot.title = element_text(hjust = 0.5, vjust=2.12))
COG0747<-subset(all,all$Code=="COG0747")
ggplot(COG0747,aes(x=Sample,y=iBAQ,fill=Taxonomy))+geom_bar(stat="identity")+ylab("Abundance")+
  ggtitle("Dipeptide_COG0747")+theme(plot.title = element_text(hjust = 0.5, vjust=2.12))
cog1653<-subset(all,all$Code=="COG1653")
ggplot(cog1653,aes(x=Sample,y=iBAQ,fill=Taxonomy))+geom_bar(stat="identity")+ylab("Abundance")+
  ggtitle("glycerol-3-phosphate_COG1653")+theme(plot.title = element_text(hjust = 0.5, vjust=2.12))
cog1879<-subset(all,all$Code=="COG1879")
ggplot(cog1879,aes(x=Sample,y=iBAQ,fill=Taxonomy))+geom_bar(stat="identity")+ylab("Abundance")+
  ggtitle("Sugar_COG1879")+theme(plot.title = element_text(hjust = 0.5, vjust=2.12))

cog2113<-subset(all,all$Code=="COG2113")
ggplot(cog2113,aes(x=Sample,y=iBAQ,fill=Taxonomy))+geom_bar(stat="identity")+ylab("Abundance")+
  ggtitle("proline/glycine betaine_COG2113")+theme(plot.title = element_text(hjust = 0.5, vjust=2.12))

cog0715<-subset(all,all$Code=="COG0715")
ggplot(cog0715,aes(x=Sample,y=iBAQ,fill=Taxonomy))+geom_bar(stat="identity")+ylab("Abundance")+
  ggtitle("Nitrate/sulfonate/bicarbonate_COG0715")+theme(plot.title = element_text(hjust = 0.5, vjust=2.12))

cog4663<-subset(all,all$Code=="COG4663")
ggplot(cog4663,aes(x=Sample,y=iBAQ,fill=Taxonomy))+geom_bar(stat="identity")+ylab("Abundance")+
  ggtitle("Mannitol/chloroaromatic compound_COG4663")+theme(plot.title = element_text(hjust = 0.5, vjust=2.12))

cog1638<-subset(all,all$Code=="COG1638")
ggplot(cog1638,aes(x=Sample,y=iBAQ,fill=Taxonomy))+geom_bar(stat="identity")+ylab("Abundance")+
  ggtitle("C4-dicarboxylate_COG1638")+theme(plot.title = element_text(hjust = 0.5, vjust=2.12))

cog1629<-subset(all,all$Code=="COG1629")
ggplot(cog1629,aes(x=Sample,y=iBAQ,fill=Taxonomy))+geom_bar(stat="identity")+ylab("Abundance")+
  ggtitle("TonB outer membrance receptor_COG1629")+theme(plot.title = element_text(hjust = 0.5, vjust=2.12))
