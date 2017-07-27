install.packages('devtools')
library(devtools)
install_github('fawda123/ggord')
library(ggord)
ord <- prcomp(iris[, 1:4])

p <- ggord(ord, iris$Species)
p
sc2<-sc2[,c(1:17,19,20)]
group<-c(rep(c("East"),6),rep(c("West"),5))
c4<-cbind(sc2,group)

ord <- prcomp(c4[, 1:22],scale=T)
ggord(ord, c4$group)

ord <- princomp(c4[, 1:10])

ggord(ord, iris$Species)



data(varespec)
data(varechem)
sol <- bioenv(wisconsin(varespec) ~ log(N) + P + K + Ca + pH + Al, varechem)
sol
summary(sol)
sol<-bioenv(wisconsin(sc2)~Phosphate+Silicate+Ammonium+Nitrite+Nitrate+Temperature+Salinity+PH+Chla,data=e2)
bioenv(sc2, e2, method = "spearman", index = "bray")



