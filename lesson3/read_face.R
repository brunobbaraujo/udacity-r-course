pf <- read.csv('pseudo_facebook.tsv',sep='\t')

library(ggplot2)

ggplot(data = pf, aes(x = dob_day)) + 
  geom_bar() + 
  scale_x_continuous(breaks = 1:31) + 
  facet_wrap(~dob_month)

qplot(x=friend_count,data = pf, xlim = c(0, 1000))
