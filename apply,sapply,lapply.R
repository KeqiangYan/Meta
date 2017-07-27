l1<-c(4,9,16)
l2<-c(25,36,49)
matrix1<-cbind(l1,l2)
matrix1
matrix1_apply1<-apply(matrix1,1,sum)
matrix1_apply1
apply(matrix1,2,sum)
apply(matrix1,1,sqrt)
apply(matrix1,2,sqrt)
myfunction<-function(x){
  result<-1+2+sqrt(x)
  return(result)
}
apply(matrix1,2,function(x) myfunction(x))
myfunction2<-function(x,y){
  result<-sqrt(x)+y
  return(result)
}
apply(matrix1,2,function(y) myfunction2(3,y))
t2<-do.call(cbind,lapply(matrix1, sqrt))
t2<-data.frame(lapply(matrix1, sqrt))
#apply可以按行或者按列操作，结果显示也可以选择，lapply的结果可以写成矩阵或字符框，
#sapply的结果是数值，直接看结果。