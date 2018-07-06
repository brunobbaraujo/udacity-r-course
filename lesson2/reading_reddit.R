reddit <- read.csv('reddit.csv')
str(reddit)

levels(reddit$state)

library(ggplot2)

reddit.income.f <- factor(reddit$income.range,levels = c('Under $20,000','$20,000 - $29,999','$30,000 - $39,999','$40,000 - $49,999','$50,000 - $69,999','$70,000 - $99,999','$100,000 - $149,999','$150,000 or more'))

qplot(data=reddit, x=reddit.income.f)