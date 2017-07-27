library(vegan)
data(varespec)
data(varechem)
veg.dist <- vegdist(varespec) # Bray-Curtis
env.dist <- vegdist(scale(varechem), "euclid")
mantel.partial(veg.dist, env.dist,vvf,method = "pearson",permutations = 999)
mantel(vvf, env.dist, method="spear")
mantel(veg.dist, veg.dist, method="spear")
gg<-c(5,5,4,3,1,2,3,4,6,7,89,4,3,1,2,4,5,7,9,2,4,3,2,2)
tem<-tem/100+0.03
vvf<-vegdist(vv)
row.names(varechem)
vv<-data.frame(row.names(varechem),tem,row.names = T)
str(vv)
str(varechem)
#vegan中标准化函数decostand
data(varespec)
sptrans <- decostand(varespec, "max")
apply(sptrans, 2, max)
sptrans <- wisconsin(varespec)

## Chi-square: PCA similar but not identical to CA.
## Use wcmdscale for weighted analysis and identical results.
sptrans <- decostand(varespec, "chi.square")
plot(procrustes(rda(sptrans), cca(varespec)))
