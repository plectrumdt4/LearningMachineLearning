#Chapter 4

#what is the difference between <- and =? 
# Only difference seems to be <- is always assignment and = is used for 
# specifying parameters with functions. I always use =

# python uses snake case- it's what I prefer too


#4.4
#1- not a proper i
#2- 

library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))# fixed data spelling

filter(mpg, cyl== 8) #corrected spelling, added ==
filter(diamonds, carat > 3) #added s



#3- help menus



