d<-read.table("26I_S10_pfam.txt",header = T,sep = "\t")
library(ggplot2)
library(grid)

g.mid<-ggplot(d,aes(x = 1,y=reorder(Pfam,-combine_iBAQ)))+geom_text(aes(label=Pfam))+
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
        axis.text.x=element_text(color=NA),
        axis.ticks.x=element_line(color=NA),
        plot.margin = unit(c(1,-1,1,-1), "mm"))
g1 <- ggplot(data = d, aes(x = reorder(Pfam,-combine_iBAQ), y = combine_iBAQ)) +
  geom_bar(stat = "identity") + ggtitle("Abundance") +
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_blank(), 
        axis.ticks.y = element_blank(), 
        plot.title = element_text(hjust = 0.5),
        plot.margin = unit(c(1,-1,1,0), "mm")) +
  scale_y_reverse() + coord_flip()

g2 <- ggplot(data = d, aes(x = reorder(Pfam,-combine_iBAQ), y = Protein_number)) +xlab(NULL)+
  geom_bar(stat = "identity") + ggtitle("Protein number") +
  theme(axis.title.x = element_blank(), axis.title.y = element_blank(), 
        axis.text.y = element_blank(), axis.ticks.y = element_blank(),
        plot.title = element_text(hjust = 0.5),
        plot.margin = unit(c(1,0,1,-1), "mm")) +
  coord_flip()
library(gridExtra)
gg1 <- ggplot_gtable(ggplot_build(g1))
gg2 <- ggplot_gtable(ggplot_build(g2))
gg.mid <- ggplot_gtable(ggplot_build(g.mid))

grid.arrange(gg1,gg.mid,gg2,ncol=3,widths=c(3/9,3/9,3/9))
