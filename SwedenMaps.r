#The function needs a data.frame with two columns, 
#the first in´s the name of a Swedish county,e.g. Dalarna and the second the data
#The function uses the column title of the data as label

swedenMap<-function(x,mypalette="Reds"){
  
  library(ggplot2)
  library(maptools)
  library(rgeos)
  library(Cairo)
  library(ggmap)
  library(scales)
  library(RColorBrewer)
  library(raster)
  library(sp)
  library(rworldxtra)
  
  y<-colnames(x)[2]
  colnames(x)<-c("NAME_1",y)

  states.shp <- readShapeSpatial("SWE_adm1.shp")
  mydata<-data.frame(NAME_1=states.shp$NAME_1, id=states.shp$ID_1)
  mydata<-merge(mydata,x,by="NAME_1")

  #fortify shape file to get into dataframe 
  states.shp.f <- fortify(states.shp, region = "ID_1")
  
  merge.shp.coef<-merge(states.shp.f, mydata, by="id", all.x=TRUE)
  final.plot<-merge.shp.coef[order(merge.shp.coef$order), ] 
  n<-names(final.plot)
  n[n=="NAME_1"]<-"Län"
  colnames(final.plot)<-n
  w<-which(names(final.plot)==yn)
  
  
  #Plot
  
  ggplot() +
    geom_polygon(data = final.plot, 
                 aes(x = long, y = lat, group = group, fill = final.plot[,w],label=Län), 
                 color = "black", size = 0.25) + 
    coord_map("")+coord_equal()+
    scale_fill_distiller(name=y, palette = mypalette, trans="reverse",breaks = pretty_breaks(n = 5))+
    #scale_fill_manual(name="My discrete variable", values=c("red", "blue", "green", "yellow"))
    theme_nothing(legend = TRUE)+
    labs(title="")
 
  
}