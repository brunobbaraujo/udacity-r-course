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
pf$year_joined <- floor(2014 - pf$tenure/365)
pf$year_joined.bucket <- cut(pf$year_joined, breaks = c(2004,2009, 2011, 2012,2014), right = TRUE)
  

  