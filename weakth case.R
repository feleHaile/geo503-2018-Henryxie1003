library(ggplot2)
library(gapminder)
library(dplyr)
new<-filter(gapminder,country!='Kuwait')
p<-ggplot(new %>% group_by(year))
p+geom_point(aes(lifeExp,gdpPercap,size=pop,col=continent))+facet_wrap('year',nrow = 2)+
  labs(x='Life Expectancy',y='GDP per Captia',size='Population')+
  theme_bw()

p2<-ggplot(new,aes(x=year,y=gdpPercap,col=continent))
p2+geom_point()+geom_line()+facet_wrap('continent',nrow=2)
