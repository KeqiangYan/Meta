me<-read.table("Methane_metabolism.txt",header = T, sep = "\t")
library(dplyr)
#me1<-me %>% group_by(Classify,KO) %>%
#  summarise(sum(S08),sum(S10),sum(S12),sum(S14),sum(S16),sum(S18),sum(S20),sum(S22),sum(S24),sum(S26),sum(S28))
me2<-me %>% group_by(Classify) %>%
  summarise(sum(S08),sum(S10),sum(S12),sum(S14),sum(S16),sum(S18),sum(S20),sum(S22),sum(S24),sum(S26),sum(S28))
colnames(me2)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
me2$Species<- as.character(me2$Species)
me21<-me2 %>% filter (Species=="Cyanobacteria"|Species=="Alphaproteobacteria"|Species=="Actinobacteria"|Species=="Gammaproteobacteria"|Species=="Deltaproteobacteria"|Species=="Bacteroidetes"|Species=="Betaproteobacteria")
library(reshape2)
me3<-melt(me21,ID="Species")
colnames(me3)<-c("Species","Samples","Intensity")
me3$r<-sqrt(me3$Intensity/pi)
ggplot(me3,aes(Samples,Species))+
  geom_point(aes(size=r*300),shape=19,color="steelblue",alpha=0.5)+
  scale_size_identity()+
  ylab("Methane metabolism")+
  theme(panel.grid.major=element_line(linetype=2,color="black"),
        axis.text.x=element_text(angle=0,hjust=0.5,vjust=0,size=rel(1.5)),
        axis.text.y = element_text(size=rel(1.5),face="bold"),
        axis.title.y = element_text(size = rel(2),face="bold",color = "darkblue"),
        axis.title.x = element_blank())

ni1<-read.table("Nitrogen_metabolism.txt",header = T, sep = "\t")
ni2<-ni1 %>% group_by(Classify) %>%
  summarise(sum(S08),sum(S10),sum(S12),sum(S14),sum(S16),sum(S18),sum(S20),sum(S22),sum(S24),sum(S26),sum(S28))
colnames(ni2)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
ni2$Species<- as.character(ni2$Species)
ni21<-ni2 %>% filter (Species=="Cyanobacteria"|Species=="Alphaproteobacteria"|Species=="Actinobacteria"|Species=="Gammaproteobacteria"|Species=="Deltaproteobacteria"|Species=="Bacteroidetes"|Species=="Betaproteobacteria")

ni3<-melt(ni21,ID="Species")
colnames(ni3)<-c("Species","Samples","Intensity")
ni3$r<-sqrt(ni3$Intensity/pi)
ggplot(ni3,aes(Samples,Species))+
  geom_point(aes(size=r*300),shape=19,color="steelblue",alpha=0.5)+
  scale_size_identity()+
  ylab("Nitrogen metabolism")+
  theme(panel.grid.major=element_line(linetype=2,color="black"),
        axis.text.x=element_text(angle=0,hjust=0.5,vjust=0,size=rel(1.5)),
        axis.text.y = element_text(size=rel(1.5),face="bold"),
        axis.title.y = element_text(size = rel(2),face="bold",color = "darkblue"),
        axis.title.x = element_blank())

ca1<-read.table("carbon_fixation_prokaryotes.txt",header = T, sep = "\t")
ca2<-ca1 %>% group_by(Classify) %>%
  summarise(sum(S08),sum(S10),sum(S12),sum(S14),sum(S16),sum(S18),sum(S20),sum(S22),sum(S24),sum(S26),sum(S28))
colnames(ca2)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
ca2$Species<- as.character(ca2$Species)
ca21<-ca2 %>% filter (Species=="Cyanobacteria"|Species=="Alphaproteobacteria"|Species=="Actinobacteria"|Species=="Gammaproteobacteria"|Species=="Deltaproteobacteria"|Species=="Bacteroidetes"|Species=="Betaproteobacteria")

ca3<-melt(ca21,ID="Species")
colnames(ca3)<-c("Species","Samples","Intensity")
ca3$r<-sqrt(ca3$Intensity/pi)
ggplot(ca3,aes(Samples,Species))+
  geom_point(aes(size=r*300),shape=19,color="steelblue",alpha=0.5)+
  scale_size_identity()+
  ylab("carbon fixation")+
  theme(panel.grid.major=element_line(linetype=2,color="black"),
        axis.text.x=element_text(angle=0,hjust=0.5,vjust=0,size=rel(1.5)),
        axis.text.y = element_text(size=rel(1.5),face="bold"),
        axis.title.y = element_text(size = rel(2),face="bold",color = "darkblue"),
        axis.title.x = element_blank())

su1<-read.table("Sulfur_metabolism.txt",header = T, sep = "\t",quote = "")
su2<-su1 %>% group_by(Classify) %>%
  summarise(sum(S08),sum(S10),sum(S12),sum(S14),sum(S16),sum(S18),sum(S20),sum(S22),sum(S24),sum(S26),sum(S28))
colnames(su2)<-c("Species","S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
su2$Species<- as.character(su2$Species)
su21<-su2 %>% filter (Species=="Cyanobacteria"|Species=="Alphaproteobacteria"|Species=="Actinobacteria"|Species=="Gammaproteobacteria"|Species=="Deltaproteobacteria"|Species=="Bacteroidetes"|Species=="Betaproteobacteria")

su3<-melt(su21,ID="Species")
colnames(su3)<-c("Species","Samples","Intensity")
su3$r<-sqrt(su3$Intensity/pi)
ggplot(su3,aes(Samples,Species))+
  geom_point(aes(size=r*300),shape=19,color="steelblue",alpha=0.5)+
  scale_size_identity()+
  ylab("Sulfur metabolism")+
  theme(panel.grid.major=element_line(linetype=2,color="black"),
        axis.text.x=element_text(angle=0,hjust=0.5,vjust=0,size=rel(1.5)),
        axis.text.y = element_text(size=rel(1.5),face="bold"),
        axis.title.y = element_text(size = rel(2),face="bold",color = "darkblue"),
        axis.title.x = element_blank())
