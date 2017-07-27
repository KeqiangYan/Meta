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

e2_1<-e2[-2,]
e2_1
#相关图，环境变量之间
panel.cor<-function(x,y,digits=2,prefix="",cex.cor, ...){
  usr<-par("usr")
  on.exit(par(usr))
  par(usr=c(0,1,0,1))
  r<-abs(cor(x,y,use="complete.obs"))
  txt<-format(c(r, 0.123456789),digits=digits)[1]
  txt<-paste(prefix,txt,sep="")
  if(missing(cex.cor)) cex.cor<- 0.8/strwidth(txt)
  text(0.5,0.5,txt,cex=cex.cor*(1+r)/2)
}

panel.hist<-function(x, ...){
  usr<-par("usr")
  on.exit(par(usr))
  par(usr=c(usr[0:2],0,1.5))
  h<-hist(x,plot=FALSE)
  breaks<-h$breaks
  nB<-length(breaks)
  y<-h$counts
  y<-y/max(y)
  rect(breaks[-nB],0,breaks[-1],y,col="white", ...)
}

pairs(e2_1,upper.panel = panel.cor,
      diag.panel = panel.hist,
      lower.panel = panel.smooth)

#data example
library(gcookbook)
c2009<-subset(countries, Year==2009,select=c(Name,GDP,laborrate,healthexp,infmortality))
pairs(c2009[,2:5],upper.panel = panel.cor,
      diag.panel = panel.hist,
      lower.panel = panel.smooth)

