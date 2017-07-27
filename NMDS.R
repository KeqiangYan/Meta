library(vegan)
#species message and abundance in different samples
data(varespec)
#environment factors in the same site
data(varechem)
#list the dissimilarity of two data,and find a better function which number is bigger
rankindex(varechem, varespec)
vare.dis <- vegdist(varespec, method="bray");range(vare.dis)
require(MASS)
vare.mds0 <- isoMDS(vare.dis) 
ordiplot(vare.mds0, type = "t")
stressplot(vare.mds0, vare.dis)
vare.mds <- metaMDS(varespec, trace = T)
plot(vare.mds, type = "t") 
