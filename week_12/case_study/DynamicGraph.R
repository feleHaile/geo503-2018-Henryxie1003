library(dplyr)
library(ggplot2)
library(ggmap)
library(htmlwidgets)
library(widgetframe)
library(rnoaa)
library(xts)        
library(dygraphs)

d=meteo_tidy_ghcnd("USW00014733",
                   date_min = "2016-01-01", 
                   var = c("TMAX"),
                   keep_flags=T)
d$date=as.Date(d$date)
t_s<-xts(d$tmax,d$date)
dygraph(t_s,main="Daily Maximum Temperature in Buffalo, NY")%>%dyRangeSelector(c("2017-01-01", "2017-12-31"))

