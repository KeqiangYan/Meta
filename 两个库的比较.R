p1<-read.table("compare-pep.txt",header = T,sep = "\t")
library(ggplot2)
library(grid)
pdf("database compare.pdf",width=6,height=4)
p1$Samples<-factor(p1$Samples,levels=c("S8","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28"))
g.mid<-ggplot(p1,aes(x = 1,y=Samples))+geom_text(aes(label=Samples))+
  #geom_segment(aes(x=0.94,xend=0.96,yend=Pfam))+
  #geom_segment(aes(x=1.04,xend=1.065,yend=Pfam))+
  ggtitle("")+
  ylab(NULL)+
  scale_x_continuous(expand=c(0,0),limits=c(0.94,1.065))+
  theme(axis.title=element_blank(),
        panel.grid=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        panel.background=element_blank(),
        panel.border=element_blank(),
        axis.text.x=element_text(color=NA),
        axis.ticks.x=element_line(color=NA),
        plot.margin = unit(c(1,-1,1,-1), "mm"))
g1 <- ggplot(data = p1, aes(x = Samples, y = Peptide_number,fill=Databases)) +
  geom_bar(stat = "identity",position="dodge") + ggtitle("# of peptide sequences") +
  scale_fill_manual(values = c("#669933","#FFCC66"))+
  theme_bw()+
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_blank(), 
        axis.ticks.y = element_blank(), 
        panel.grid.major=element_line(colour=NA),
        panel.grid.minor=element_line(colour=NA),
        panel.border=element_blank(),
        plot.title = element_text(hjust = 0.5),
        plot.margin = unit(c(1,-1,1,0), "mm")) +
  guides(fill=FALSE)+
  scale_y_reverse() + coord_flip()

g2 <- ggplot(data = p1, aes(x = Samples, y = Protein_number,fill=Databases)) +xlab(NULL)+
  geom_bar(stat = "identity",position="dodge") + ggtitle("# of protein groups") +
  scale_fill_manual(values = c("#669933","#FFCC66"))+
  theme_bw()+
  theme(axis.title.x = element_blank(), axis.title.y = element_blank(), 
        axis.text.y = element_blank(), axis.ticks.y = element_blank(),
        panel.grid.major=element_line(colour=NA),
        panel.grid.minor=element_line(colour=NA),
        panel.border=element_blank(),
        plot.title = element_text(hjust = 0.5),
        plot.margin = unit(c(1,0,1,-1), "mm")) +
  guides(fill=guide_legend(title=NULL))+
  coord_flip()
library(gridExtra)
gg1 <- ggplot_gtable(ggplot_build(g1))
gg2 <- ggplot_gtable(ggplot_build(g2))
gg.mid <- ggplot_gtable(ggplot_build(g.mid))

grid.arrange(gg1,gg.mid,gg2,ncol=3,widths=c(6/9,0.5/9,4/9))
dev.off()