# Lesson 5
# Exercises
  
# 0. Read Data
library(ggplot2)
data("diamonds")
pf <- diamonds
rm(diamonds)


### 1. Histogram Price prices facet by color
ggplot(aes(x = price), data = pf) +
  geom_histogram(aes(color = cut),binwidth = 100) +
  scale_fill_brewer(type = 'qual') +
  facet_wrap(~ color) +
  coord_cartesian(xlim=c(0,12000))
