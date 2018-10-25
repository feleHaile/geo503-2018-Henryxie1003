library(sf)
library(tidyverse)
library(ggmap)
library(rnoaa)
library(sp)
library(spData)
library(ggplot2)
data(world)
data(us_states)

storm<-storm_shp(basin='NA')
storm_1<-read_sf(storm$path)
storm_sf<-st_as_sf(storm_1)%>%filter(year>=1950)


storm_filter<-storm_sf%>%mutate_if(is.numeric,function(x) ifelse(x==-999.0,NA,x))%>%mutate(decade=(floor(year/10)*10))

region<-st_bbox(storm_filter)

ggplot(world$geom)+geom_sf()+
  facet_wrap(~decade)+
  stat_bin2d(data=storm_filter, aes(y=st_coordinates(storm_filter)[,2], x=st_coordinates(storm_filter)[,1]),bins=100)+
  scale_fill_distiller(palette="YlOrRd", trans="log", direction=-1, breaks = c(1,10,100,1000))+
  coord_sf(ylim=region[c(2,4)], xlim=region[c(1,3)])
