setwd("C:\\Users\\Jesper\\Documents\\JEM\\R\\Maps\\Chlorpleth")
nki<-read.csv("geosummary.csv",dec=",",sep=";")
nki<-data.frame(nki)
nki<-data.frame(tapply(nki$NKI,nki$Landskap,mean))
nki<-data.frame(NAME_1=row.names(nki),NKI=nki)
colnames(nki)<-c("NAME_1","NKI")

swedenMap(nki,"RdPu",dir="C:\\Users\\Jesper\\Documents\\JEM\\Grafer")
