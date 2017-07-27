new_data<-read.table("out_id_new.txt",header=F,sep="\t")
names(new_data)<-c("PSM","E_value","delta_m","Peptides","Protein")
library(ggplot2)
hist(new_data$E_value)
ggplot(new_data,aes(x=E_value))+geom_histogram(binwidth=0.0005,fill="white",colour="black")
old_data<-read.table("out_id_old.txt",header=F,sep="\t")
names(old_data)<-c("PSM","E_value","delta_m","Peptides","Protein")
hist(old_data$E_value)
ggplot(old_data,aes(x=E_value))+geom_histogram(binwidth=0.0005,fill="white",colour="black")
new_data<-as.data.frame(new_data)
new_psm<-unlist(new_data[,1])
old_psm<-unlist(old_data[,1])
library(VennDiagram)

D<-venn.diagram(list(A=old_psm,B=new_psm),filename=NULL,lwd=1,lty=1,col=c('black','black'),fill=c('red','green'),cat.col=c('black','black'))#,rotation.degree=90)
grid.draw(D)

old_data1<-read.table("old_psm_evalue.txt",header=F,sep="\t")
names(old_data1)<-c("E_value")
ggplot(old_data1,aes(x=E_value))+geom_histogram(binwidth=0.0005,fill="white",colour="black")



gos<-read.table("gos_only_deltam.txt",header=F,sep="\t")
names(gos)<-c("delta_m")
all<-read.table("over_deltam.txt",header=F,sep="\t")
names(all)<-c("delta_m")
ggplot(tara,aes(x=delta_m))+geom_histogram(binwidth =0.2,fill="white",colour="black")+xlab("delta_m")+annotate("TARA")
ggplot(gos,aes(x=delta_m))+geom_histogram(binwidth =0.2,fill="white",colour="black")+xlab("delta_m")+title("GOS")
binsize<-diff(range(all$delta_m))/3
ggplot(all,aes(x=delta_m))+geom_histogram(binwidth =0.2,fill="white",colour="black")+xlab("delta_m")+title("Both")
