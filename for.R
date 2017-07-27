t<-read.table("all_samples.ibaq",header=T,sep="\t")
t$Code<-as.character(t$Code)
i=1
while (i<590){
  if (t[i,1]=="COG0834"){
    t[i,5]<-c("Amino acid")
    t[i,6]<-c("ABC type organics")
  }
  else if(t[i,1]=="COG0683"){
    t[i,5]<-c("Branched-chain amino acid")
    t[i,6]<-c("ABC type organics")
  }
  else if(t[i,1]=="COG0747"){
    t[i,5]<-c("Dipeptide")
    t[i,6]<-c("ABC type organics")
  }
  else if(t[i,1]=="COG4166"){
    t[i,5]<-c("Oligopeptide")
    t[i,6]<-c("ABC type organics")
  }
  else if(t[i,1]=="COG1653"){
    t[i,5]<-c("Glycerol-3-phosphate")
    t[i,6]<-c("ABC type organics")
  }
  else if(t[i,1]=="COG1879"){
    t[i,5]<-c("Sugar")
    t[i,6]<-c("ABC type organics")
  }
  else if(t[i,1]=="COG4213"){
    t[i,5]<-c("Xylose")
    t[i,6]<-c("ABC type organics")
  }
  else if(t[i,1]=="COG2113"){
    t[i,5]<-c("Proline/glycine betaine")
    t[i,6]<-c("ABC type organics")
  }
  else if(t[i,1]=="COG4521"){
    t[i,5]<-c("Taurine")
    t[i,6]<-c("ABC type organics")
  }
  else if(t[i,1]=="COG1840"){
    t[i,5]<-c("Fe3+ transport ")
    t[i,6]<-c("ABC type inorganics")
    
  }
  else if(t[i,1]=="COG0226"){
    t[i,5]<-c("Phosphate")
    t[i,6]<-c("ABC type inorganics")
  }
  else if(t[i,1]=="COG3221"){
    t[i,5]<-c("Phosphate/phosphonate")
    t[i,6]<-c("ABC type inorganics")
  }
  else if(t[i,1]=="COG0715"){
    t[i,5]<-c("Nitrate/sulfonate/bicarbonate")
    t[i,6]<-c("ABC type inorganics")
  }
  else if(t[i,1]=="COG4663"){
    t[i,5]<-c("Mannitol/chloroaromatic compound")
    t[i,6]<-c("TRAP type")
  }
  else if(t[i,1]=="COG1638"){
    t[i,5]<-c("C4-dicarboxylate")
    t[i,6]<-c("TRAP type")
  }
  else if(t[i,1]=="COG2358"){
    t[i,5]<-c("Uncharacterized transport")
    t[i,6]<-c("TRAP type")
  }
  else if(t[i,1]=="COG1629"){
    t[i,5]<-c("TonB outer membrance receptor")
    t[i,6]<-c("TonB type")
  }
  i=i+1
}
t$Code<-factor(t$Code,levels = c("COG0834","COG0683","COG0747","COG4166","COG1653","COG1879","COG4213","COG2113","COG4521","COG1840","COG0226","COG3221","COG0715","COG4663","COG1638","COG2358","COG1629"))
colnames(t)<-c("Code","Species","Abundance","Samples","Transport","Type")
library(ggplot2)
actin<-subset(t,t$Species=="Actinobacteria <phylum>")
png("actin.png",width = 600,height = 450)
ggplot(actin, aes(x=factor(Transport), y=Abundance))+
  geom_boxplot(aes(fill=Type))+ylab("Abundance")+xlab("Actinobacteria")+
  theme(axis.text.x = element_text(angle = 60,hjust = 0.8,vjust = 0.8,size=12,lineheight = 9,face = "bold.italic"))
dev.off()
Alpha<-subset(t,t$Species=="Alphaproteobacteria")
png("Alpha.png",width = 600,height = 450)
ggplot(Alpha, aes(x=factor(Transport), y=Abundance))+
  geom_boxplot(aes(fill=Type))+ylab("Abundance")+xlab("Alphaproteobacteria")+
  theme(axis.text.x = element_text(angle = 60,hjust = 0.8,vjust = 0.8,size=12,lineheight = 9,face = "bold.italic"))
dev.off()
Beta<-subset(t,t$Species=="Betaproteobacteria")
png("Beta.png",width = 600,height = 450)
ggplot(Beta, aes(x=factor(Transport), y=Abundance))+
  geom_boxplot(aes(fill=Type))+ylab("Abundance")+xlab("Betaproteobacteria")+
  theme(axis.text.x = element_text(angle = 60,hjust = 0.8,vjust = 0.8,size=12,lineheight = 9,face = "bold.italic"))
dev.off()
Gamma<-subset(t,t$Species=="Gammaproteobacteria")
png("Gamma.png",width = 600,height = 450)
ggplot(Gamma, aes(x=factor(Transport), y=Abundance))+
  geom_boxplot(aes(fill=Type))+ylab("Abundance")+xlab("Gammaproteobacteria")+
  theme(axis.text.x = element_text(angle = 60,hjust = 0.8,vjust = 0.8,size=12,lineheight = 9,face = "bold.italic"))
dev.off()
delta<-subset(t,t$Species=="delta/epsilon subdivisions")
png("delta.png",width = 600,height = 450)
ggplot(delta, aes(x=factor(Transport), y=Abundance))+
  geom_boxplot(aes(fill=Type))+ylab("Abundance")+xlab("deltaproteobacteria")+
  theme(axis.text.x = element_text(angle = 60,hjust = 0.8,vjust = 0.8,size=12,lineheight = 9,face = "bold.italic"))
dev.off()
Cyan<-subset(t,t$Species=="Cyanobacteria")
png("Cyan.png",width = 600,height = 450)
ggplot(Cyan, aes(x=factor(Transport), y=Abundance))+
  geom_boxplot(aes(fill=Type))+ylab("Abundance")+xlab("Cyanobacteria")+
  theme(axis.text.x = element_text(angle = 60,hjust = 0.8,vjust = 0.8,size=12,lineheight = 9,face = "bold.italic"))
dev.off()
fcb<-subset(t,t$Species=="FCB group")
png("FCB.png",width = 600,height = 450)
ggplot(fcb, aes(x=factor(Transport), y=Abundance))+
  geom_boxplot(aes(fill=Type))+ylab("Abundance")+xlab("FCB group")+
  theme(axis.text.x = element_text(angle = 60,hjust = 0.8,vjust = 0.8,size=12,lineheight = 9,face = "bold.italic"))
dev.off()
pvc<-subset(t,t$Species=="PVC group")
png("PVC.png",width = 600,height = 450)
ggplot(pvc, aes(x=factor(Transport), y=Abundance))+
  geom_boxplot(aes(fill=Type))+ylab("Abundance")+xlab("PVC group")+
  theme(axis.text.x = element_text(angle = 60,hjust = 0.8,vjust = 0.8,size=12,lineheight = 9,face = "bold.italic"))
dev.off()