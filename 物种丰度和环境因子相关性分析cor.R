env<-read.csv("t1.csv",header = T)
Sample<-c("S08","S10","S12","S14","S16","S18","S20","S22","S24","S26","S28")
env<-data.frame(env,row.names = 1)
e1<-t(env)
e11<-as.data.frame(e1,row.names = F)
e2<-as.data.frame(cbind(Sample,e1))
row.names(e2)<-e2[,1]
e2<-e2[,-1]
e2$Phosphate<-as.numeric(as.character(e2$Phosphate))
e2$Silicate<-as.numeric(as.character(e2$Silicate))
e2$Ammonium<-as.numeric(as.character(e2$Ammonium))
e2$Nitrite<-as.numeric(as.character(e2$Nitrite))
e2$Nitrate<-as.numeric(as.character(e2$Nitrate))
e2$Temperature<-as.numeric(as.character(e2$Temperature))
e2$Salinity<-as.numeric(as.character(e2$Salinity))
e2$PH<-as.numeric(as.character(e2$PH))
e2$Chla<-as.numeric(as.character(e2$Chla))
spe<-read.table("all_samplewgs_ibaq.txt",header = T,sep = "\t") #WGS数据读取
#spe<-read.table("all_sample_ibaq.txt",header = T,sep = "\t") #GOS数据读取
sc<-data.frame(spe,row.names = 1)
sc1<-t(sc)
sc1<-as.data.frame(sc1,row.names = F)
sc2<-as.data.frame(cbind(Sample,sc1))
row.names(sc2)<-sc2[,1]
sc2<-sc2[,-1]
#环境变量与物种分析-逐一分析
#分析前五个环境参数，不包括10号样本，物种不包括带有缺失值的物种以及真核和病毒
#sp<-sc2[-2,c(-2,-12,-20,-21,-22)] #GOS缺失值以及物种的排列顺序和WGS的数据不同，使用时应注意
sp<-sc2[-2,c(-9,-11,-18,-20,-21,-22)] #WGS缺失值的处理22-6=16
ev<-e2[-2,]
#分析后4个环境参数时可以包含10号样本
ev<-e2
#sp<-sc2[,c(-2,-12,-20,-21,-22)]
sp<-sc2[,c(-9,-11,-18,-20,-21,-22)]
#产生a和b两个矩阵，分别代表了p-value和相关系数
i=1
j=1
a<-matrix(NA,16,9) #修改参数！！！
b<-matrix(NA,16,9) #修改参数！！！
while(i<17){       #修改参数！！！
  for (j in 1:9){
    ss<-sp[,i]
    ee<-ev[,j]
    cor1<-cor.test(ss,ee,method="pearson")
    a[i,j]<-cor1$p.value
    if (a[i,j]<0.05){
      b[i,j]<-as.numeric(cor1$estimate)
    }
    j=j+1
  }
  i=i+1
}
dfa<-as.data.frame(a)
colnames(dfa)<-colnames(ev)
rownames(dfa)<-colnames(sp)
dfb<-as.data.frame(b)
colnames(dfb)<-colnames(ev)
rownames(dfb)<-colnames(sp)

#q-value 校正数据
library(qvalue)
a33<-qvalue(a)
acv<-a33$qvalues







