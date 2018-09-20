#library(dplyr)
library(tidyverse)
library(nycflights13)
library(ggplot2)

J1<-left_join(flights,planes,by='tailnum')
J1<-left_join(J1,airlines,by='carrier')

names(airports)[1]<-'dest'
J1<-left_join(J1,airports,by='dest')

Far_dis<-arrange(J1,desc(distance))
Far_airport<-Far_dis$name.y[1]
Far_airport
