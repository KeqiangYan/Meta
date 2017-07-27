ion<-read.table("wujiyan.txt",header = T,sep = "\t")
cor.test(ion$Inorganic_ion,ion$Temperature)
cor.test(ion$Inorganic_ion,ion$Salinity)
library(ggplotthemr)
library(psych)
fen<-read.table("fenzibanlv.txt",header = T,sep = "\t")
fen
cor.test(fen$chaperone,fen$temperature)
tem<-fen$temperature
cor.test(fen$chaperone,fen$Salinity)
