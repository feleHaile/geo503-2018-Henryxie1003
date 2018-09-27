library(tidyverse)
library(sf)
library(sp)
library(spData)
library(ggplot2)
library(units)

albers="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

data("world")
data("us_states")

prj_states<-st_transform(us_states,albers)
ny<-prj_states%>%filter(prj_states$NAME=='New York')
plot(ny$geometry)

newworld<-st_transform(world,albers)
plot(newworld$geom)

ca<-newworld %>% filter(newworld$name_long=='Canada')
plot(ca$geom)

ca_buf<-st_buffer(ca$geom,dist=10000)
plot(ca_buf)

border<-st_intersection(ny$geometry,ca_buf)
plot(border)

b<-ggplot(border)
b+geom_sf(data = ny)+geom_sf(colour='red',fill='red')

area=set_units(st_area(border),km^2)
area