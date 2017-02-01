setwd("C:\\Users\\Jesper\\Documents\\JEM\\R\\Maps\\Chlorpleth")
nki<-read.csv("geosummary.csv",dec=",",sep=";")
nki<-data.frame(nki)

nki<-data.frame(tapply(nki$NKI,nki$Landskap,mean))
nki<-data.frame(NAME_1=row.names(nki),NKI=nki)
colnames(nki)<-c("NAME_1","NKI")

swedenMap(nki,"RdPu",dir="C:\\Users\\Jesper\\Documents\\JEM\\Grafer")

######################################################################
setwd("C:\\Users\\Jesper\\Documents\\JEM\\R\\Maps\\Chlorpleth")
nki<-read.csv("geosummary.csv",dec=",",sep=";")
nki<-data.frame(nki)

nki<-data.frame(tapply(nki$NKI,nki$Landskap,length))
nki<-data.frame(NAME_1=row.names(nki),Antal=nki)
colnames(nki)<-c("NAME_1","Antal")

p<-swedenMap(nki,"GnBu")


dir<-"C:\\Users\\Jesper\\Documents\\JEM\\Grafer"
setwd(dir)
ggsave(p, file = "Sweden_antal.png", width = 6, height = 4.5, type = "cairo-png",dpi=300)

