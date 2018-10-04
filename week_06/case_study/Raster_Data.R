library(raster)
library(sf)
library(sp)
library(spData)
library(tidyverse)

data("world")
tmax_monthly<-getData(name='worldclim',var='tmax',res=10)
gain(tmax_monthly)<-0.1
world_trans<-world%>%
  filter(name_long!='Antarctica')%>%
  as_Spatial()

#plot(tmax_monthly)
tmax_annual<-max(tmax_monthly)
plot(tmax_annual)
names(tmax_annual)<-'tmax'
tmax<-raster::extract(tmax_annual,world_trans,fun=max,na.rm=TRUE,small=TRUE,sp=1)
tmax_sf<-st_as_sf(tmax)
ggplot(tmax_sf,aes(fill=tmax))+geom_sf()+scale_fill_viridis_c(name="Annual\nMaximum\nTemperature (C)")
