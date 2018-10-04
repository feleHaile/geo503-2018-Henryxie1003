library(dplyr)
library(tidyr)
library(sp)
library(ggplot2)
library(raster)
library(rgeos)
library(devtools)
library(maptools)
install_github("adammwilson/DataScienceData")
library(DataScienceData)
library(rasterVis)
library(raster)

getData("GADM")
data("southAfrica")

sa<-southAfrica
plot(sa)
sa@data

us<-getData('GADM',country='USA',level=1)
plot(gSimplify(us,0.01))

x<-raster()