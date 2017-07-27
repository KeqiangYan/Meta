
library(gmodels)
library(ggplot2)
## step 1: 数据的读取和处理
env<-read.csv("t1.csv",header = T)
env<-env[c(1,2,4,5,6,7,8,9,10,11,12)]
Sample<-c("S08","S12","S14","S16","S18","S20","S22","S24","S26","S28")
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
outname = "lychee.PCA.png"
group<-c(rep(c("East"),5),rep(c("West"),5))

## step2：PCA分析
# do PCA 
data.pca <- fast.prcomp(e2,scale=T)
#data.pca <- fast.prcomp(data,retx=T,scale=T,center=T)    # 启用这句话，则将对数据进行归一化

## step3： PCA结果解析
# fetch the proportion of PC1 and PC2
a <- summary(data.pca)
tmp <- a[4]$importance
pro1 <- as.numeric(sprintf("%.3f",tmp[2,1]))*100
pro2 <- as.numeric(sprintf("%.3f",tmp[2,2]))*100

# 将成分矩阵转换为数据框
pc = as.data.frame(a$x)

# 给pc的数据框添加名称列和分组列（用来画图）
pc$group = group
pc$names = rownames(pc)

## step 4: 绘图
# draw PCA plot figure
xlab=paste("PC1(",pro1,"%)",sep="") 
ylab=paste("PC2(",pro2,"%)",sep="")
pca=ggplot(pc,aes(PC1,PC2)) + 
  geom_point(size=3,aes(shape=group,color=group)) + 
  geom_text(aes(label=names),size=4)+labs(x=xlab,y=ylab,title="PCA") + 
  geom_hline(yintercept=0,linetype=4,color="grey") + 
  geom_vline(xintercept=0,linetype=4,color="grey") + 
  theme_bw()

# 保存结果
ggsave(outname,pca,width=10,height=8)