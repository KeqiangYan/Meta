#构建训练集和测试集
loc<-"http://archive.ics.uci.edu/ml/machine-learning-databases/"
ds<-"breast-cancer-wisconsin/breast-cancer-wisconsin.data"
url<-paste(loc,ds,sep = "")
breast<-read.table(url,sep = ",",header = F, na.strings = "?")
names(breast)<-c("ID","clumpThickness","sizeUniformity","shapeUniformty","maginalAdhesion",
                 "singleEpitheliaCellSize","bareNuclei","blandChromation",
                 "normalNucleoli","mitosis","class")
df<-breast[-1]
df$class<-factor(df$class,level=c(2,4),labels = c("benign","maligant"))
set.seed(1234)
train<-sample(nrow(df),0.7*nrow(df))
df.train<-df[train,]
df.validate<-df[-train,]
table(df.train$class)
table(df.validate$class)
#逻辑回归
fit.logit<-glm(class~.,data=df.train,family=binomial())
summary(fit.logit)
prob<-predict(fit.logit,df.validate,type="response")
logit.pred<-factor(prob>0.5, levels=c(FALSE,TRUE),
                   labels=c("benign","malignant"))
logit.perf<-table(df.validate$class, logit.pred,
                  dnn=c("Actual","Predicted"))
logit.perf
#决策树
library(rpart)
set.seed(1234)
dtree<-rpart(class ~.,data=df.train,method="class",parms = list(split="information"))
summary(dtree)
dtree$cptable
plotcp(dtree)
dtree.pruned<-prune(dtree,cp=.0125)
library(rpart.plot)
prp(dtree.pruned,type=2,extra=104,
    fallen.leaves = T,main="Decision Tree")
dtree.pred<-predict(dtree.pruned,df.validate,type="class")
dtree.perf<-table(df.validate$class,dtree.pred,
                  dnn=c("Actual","Predicted"))
dtree.perf
