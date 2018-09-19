library(ggplot2)
library(gapminder)
library(dplyr)
new<-filter(gapminder,country!='Kuwait')
p<-ggplot(new %>% group_by(year))
p+geom_point(aes(lifeExp,gdpPercap,size=pop/100000,col=continent))+facet_wrap('year',nrow = 1)+
  labs(x='Life Expectancy',y='GDP per Capita',size='Population(100k)')+
  scale_y_continuous(trans = "sqrt")+
  theme_bw()+
  ggsave('plot1.png',path='week_06/class_tasks',width = 15,units = 'in')

Avg_data<-new %>% group_by(continent, year)%>% summarise(gdpPercapweighted = mean(x=gdpPercap, w=pop),
                                               pop = sum(as.numeric(pop)))

p2<-ggplot(new,aes(x=year,y=gdpPercap,col=continent))
p2+geom_point()+
  geom_line(aes(group=country))+
  geom_point()+
  geom_point(data=Avg_data,aes(x=year,y=gdpPercapweighted,size=pop/1000000),colour='black')+
  geom_line(data=Avg_data,aes(x=year,y=gdpPercapweighted),colour='black')+
  facet_wrap('continent',nrow=1)+
  labs(x='Year',y='GDP per Capita',size='Population(milion)')+
  theme_bw()+
  ggsave('plot2.png',path='week_06/class_tasks', width = 15,units = 'in' )
