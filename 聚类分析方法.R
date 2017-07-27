# Install factoextra package as follow:
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/factoextra")
# Install cluster and dendextend packages as follow:
install.packages("cluster")
install.packages("dendextend")
# Load the packages :
library(cluster)
library(dendextend)
library(factoextra)

# Load the data set
data("USArrests")
# Remove any missing value (i.e, NA values for not available)
# That might be present in the data
df <- na.omit(USArrests)
# View the firt 6 rows of the data
head(df, n = 6)
# Before hierarchical clustering, we can compute some descriptive statistics:
desc_stats <- data.frame(
  Min = apply(df, 2, min), # minimum
  Med = apply(df, 2, median), # median
  Mean = apply(df, 2, mean), # mean
  SD = apply(df, 2, sd), # Standard deviation
  Max = apply(df, 2, max) # Maximum
)
desc_stats <- round(desc_stats, 1)
head(desc_stats)
# scale the number
df <- scale(df)
head(df)
# Dissimilarity matrix,get distance number
d <- dist(df, method = "euclidean")
# Hierarchical clustering using Ward's method
res.hc <- hclust(d, method = "ward.D2" )
# Plot the obtained dendrogram
plot(res.hc, cex = 0.6, hang = -1)

library("cluster")
# Compute agnes()
res.agnes <- agnes(df, method = "ward")
# Agglomerative coefficient
res.agnes$ac
pltree(res.agnes, cex = 0.6, hang = -1,
       main = "Dendrogram of agnes")
# plot.hclust()
plot(as.hclust(res.agnes), cex = 0.6, hang = -1)
# plot.dendrogram()
plot(as.dendrogram(res.agnes), cex = 0.6, 
     horiz = TRUE)
# Cut tree into 4 groups
grp <- cutree(res.hc, k = 4)
# Number of members in each cluster
table(grp)
# Get the names for the members of cluster 1
rownames(df)[grp == 1]
plot(res.hc, cex = 0.6)
rect.hclust(res.hc, k = 4, border = 2:5)

