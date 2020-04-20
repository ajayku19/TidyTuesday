library(tidyverse)
#read data
beer_states <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/beer_states.csv')

#filter by state
beer_states %>% filter(state == "AZ") -> azbeer

#stacked bar graph
p <- ggplot(azbeer, aes(x=year, y=barrels, fill=type)) + geom_bar(position="stack", stat="identity")
p + ggtitle("Arizona Beer Production", subtitle="Count of Barrels by Type") +
xlab(label="Year") + ylab(label="Barrels Produced") + ylim(0, 60000)
