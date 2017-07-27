h<-read.table("alpha.txt",header = T,sep = "\t")
library(ggplot2)
ggplot(h,aes(x=alpha16S,y=alphaGOS,color=Group))+
  geom_point(size=1.5)+coord_fixed()+
  xlim(10,50)+ylim(10,50)+
  geom_abline(intercept = 0,slope=1,size=1)+
  geom_text(aes(y=alphaGOS+0.2,label=Sample,hjust=1.5))+
  ggtitle("Alphaproteobacteria")+
  xlab("16S Abundance")+ylab("Protein Abundance")+
  theme(axis.line = element_line(colour = "black",size = 1),
        #panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))

ggplot(h,aes(x=Cyanobacteria16,y=CyanobacteriaGOS,color=Group))+
  geom_point(size=1.5)+coord_fixed()+
  xlim(30,80)+ylim(30,80)+
  geom_abline(intercept = 0,slope=1,size=1)+
  geom_text(aes(y=CyanobacteriaGOS+0.2,label=Sample,hjust=1.5))+
  ggtitle("Cyanobacteria")+
  xlab("16S Abundance")+ylab("Protein Abundance")+
  theme(axis.line = element_line(colour = "black",size = 1),
        #panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))
 
ggplot(h,aes(x=Actinobacteria16,y=ActinobacteriaGOS,color=Group))+
  geom_point(size=1.5)+coord_fixed()+
  xlim(0,30)+ylim(0,30)+
  geom_abline(intercept = 0,slope=1,size=1)+
  geom_text(aes(y=ActinobacteriaGOS+0.2,label=Sample,hjust=1.5))+
  ggtitle("Actinobacteria")+
  xlab("16S Abundance")+ylab("Protein Abundance")+
  theme(axis.line = element_line(colour = "black",size = 1),
        #panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))

ggplot(h,aes(x=Bacteroidetes16,y=BacteroidetesGOS,color=Group))+
  geom_point(size=1.5)+coord_fixed()+
  xlim(0,20)+ylim(0,20)+
  geom_abline(intercept = 0,slope=1,size=1)+
  geom_text(aes(y=BacteroidetesGOS+0.2,label=Sample,hjust=1.5))+
  ggtitle("Bacteroidetes")+
  xlab("16S Abundance")+ylab("Protein Abundance")+
  theme(axis.line = element_line(colour = "black",size = 1),
        #panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))

ggplot(h,aes(x=Deltaproteobacteria16,y=DeltaproteobacteriaGOS,color=Group))+
  geom_point(size=1.5)+coord_fixed()+
  xlim(0,2.5)+ylim(0,2.5)+
  geom_abline(intercept = 0,slope=1,size=1)+
  geom_text(aes(y=DeltaproteobacteriaGOS+0.05,label=Sample,hjust=1.5))+
  ggtitle("Deltaproteobacteria")+
  xlab("16S Abundance")+ylab("Protein Abundance")+
  theme(axis.line = element_line(colour = "black",size = 1),
        #panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))

ggplot(h,aes(x=Gammaproteobacteria16,y=GammaproteobacteriaGOS,color=Group))+
  geom_point(size=1.5)+coord_fixed()+
  xlim(0,7.5)+ylim(0,7.5)+
  geom_abline(intercept = 0,slope=1,size=1)+
  geom_text(aes(y=GammaproteobacteriaGOS+0.2,label=Sample,hjust=1.5))+
  ggtitle("Gammaproteobacteria")+
  xlab("16S Abundance")+ylab("Protein Abundance")+
  theme(axis.line = element_line(colour = "black",size = 1),
        #panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))

ggplot(h,aes(x=Candidatus_Marinimicrobia16,y=Candidatus_MarinimicrobiaGOS,color=Group))+
  geom_point(size=1.5)+coord_fixed()+
  xlim(0,4)+ylim(0,4)+
  geom_abline(intercept = 0,slope=1,size=1)+
  geom_text(aes(y=Candidatus_MarinimicrobiaGOS+0.05,label=Sample,hjust=1.5))+
  ggtitle("Candidatus_Marinimicrobia")+
  xlab("16S Abundance")+ylab("Protein Abundance")+
  theme(axis.line = element_line(colour = "black",size = 1),
        #panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))

ggplot(h,aes(x=Cyanobacteria16,y=CyanobacteriaGOS,color=Group))+
  geom_point(size=1.5)+coord_fixed()+
  xlim(30,80)+ylim(30,80)+
  geom_abline(intercept = 0,slope=1,size=1)+
  geom_text(aes(y=CyanobacteriaGOS+0.2,label=Sample,hjust=1.5))+
  ggtitle("Cyanobacteria")+
  xlab("16S Abundance")+ylab("Protein Abundance")+
  theme(axis.line = element_line(colour = "black",size = 1),
        #panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5))


