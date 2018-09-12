# Lesson 5
# Exercises
  
# 0. Read Data
library(ggplot2)
data("diamonds")
pf <- diamonds
rm(diamonds)


# 1. Histogram Price prices facet by color
ggplot(aes(x = price), data = pf) +
  geom_histogram(aes(color = cut)) +
  scale_x_log10() +
  facet_wrap(~ color) +
  scale_fill_brewer(type = 'qual')
  
# 2. Scatterplot of diamond price vs. 
# table and color the points by the cut
ggplot(aes(x = table, y = price), data = pf) +
  geom_point(aes(color = cut),size = 5) +
  scale_color_brewer(type = 'qual') +
  coord_cartesian(xlim=c(50,80))

# 4. scatterplot of diamond price vs.
# volume (x * y * z) and color the points by
# the clarity of diamonds. Use scale on the y-axis
# to take the log10 of price. You should also
# omit the top 1% of diamond volumes from the plot.
  
pf$volume <- with(pf, x*y*z)
ggplot(aes(x = volume, y = price), data = pf) +
  geom_point(aes(color = clarity),size = 3) +
  scale_y_log10() +
  scale_color_brewer(type = 'div') +
  coord_cartesian(xlim=c(0,quantile(pf$volume,0.99)))
  
# 5. Create a line graph of the median proportion of
# friendships initiated ('prop_initiated') vs.
# tenure and color the line segment by
# year_joined.bucket.
pf <- read.csv("~/R/udacity scripts/lesson5/pseudo_facebook.tsv",sep="\t")
pf <- subset(pf, friend_count > 0)
pf$year_joined <- floor(2014 - pf$tenure/365)
pf$year_joined.bucket <- cut(pf$year_joined, breaks = c(2004,2009, 2011, 2012,2014), right = TRUE)
pf$prop_initiated = with(pf, as.double(friendships_initiated/friend_count))

ggplot(aes(x = tenure, y = prop_initiated), data = pf) +
  geom_smooth(aes(color = year_joined.bucket))

mean(subset(pf,year_joined.bucket == "(2012,2014]")$prop_initiated)
  
# 6. Create a scatter plot of the price/carat ratio
# of diamonds. The variable x should be
# assigned to cut. The points should be colored
# by diamond color, and the plot should be
# faceted by clarity.

ggplot(aes(x = cut, y = price/carat), data = pf) +
  geom_point(alpha = 1/3, aes(color = color),position = position_jitter(h=0.1)) +
  scale_color_brewer(type = 'div') +
  facet_wrap(~ clarity)
  


  