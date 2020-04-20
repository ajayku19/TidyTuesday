#measels vacc

#read data 
measles <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-25/measles.csv')

#clean data
measles <- subset(measles, enroll >0)
measles <- subset(measles, (!is.na(measles[,13])) & (!is.na(measles[,14])))
measles2 <- measles[c(2, 13:14)]

library(reshape2)  #install package
library(tidyverse)

#melt data in long format
measelsMelt <- melt(measles2, id.vars = c("state"), variable.name = "exclusion", value.name = "percent")
library(rcartocolor)   #install package 

#plot
p <- ggplot(measelsMelt, aes(x=reorder(state,-percent), y=percent, fill=reorder(exclusion, -percent))) 
+ stat_summary(geom="bar", fun.y = mean, position = "dodge", color= "black", size=0.5) + theme_bw()

p + labs(title = "Why are students exempt from Vaccination?", x ="state", y = "Avg%")
