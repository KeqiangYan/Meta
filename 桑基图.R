library(networkD3)
#library("d3Network")
#library(xlsx)
#setwd("D:/R/File/")
Sankey<-read.table("test.txt",header = T,sep = "\t",stringsAsFactors = F)Sankeylinks<-Sankey
Sankeynodes<-data.frame(name=unique(c(Sankeylinks$Source,Sankeylinks$Target)),stringsAsFactors=FALSE)  
Sankeynodes$index<-0:(nrow(Sankeynodes) - 1)
Sankeylinks<-merge(Sankeylinks,Sankeynodes,by.x="Source",by.y="name")
Sankeylinks<-merge(Sankeylinks,Sankeynodes,by.x="Target",by.y="name")

Sankeydata<-Sankeylinks[,c(4,5,3)];names(Sankeydata)<-c("Source","Target","Value")
Sankeyname<-Sankeynodes[,1,drop=FALSE]

使用Networkd3包里面的桑基图函数实现：
sankeyNetwork(Links=Sankeydata,Nodes=Sankeyname, Source ="Source",
              Target = "Target", Value = "Value", NodeID = "name",
              units = "TWh", fontSize = 12, nodeWidth = 30)

###
#library(networkD3)
nodes = data.frame("name" = 
                     c("Node A", # Node 0
                       "Node B", # Node 1
                       "Node C", # Node 2
                       "Node D"))# Node 3
links = as.data.frame(matrix(c(
  0, 1, 10, # Each row represents a link. The first number
  0, 2, 20, # represents the node being conntected from. 
  1, 3, 30, # the second number represents the node connected to.
  2, 3, 40),# The third number is the value of the node
  byrow = TRUE, ncol = 3))
names(links) = c("source", "target", "value")
sankeyNetwork(Links = links, Nodes = nodes,
              Source = "source", Target = "target",
              Value = "value", NodeID = "name",
              fontSize= 12, nodeWidth = 30)