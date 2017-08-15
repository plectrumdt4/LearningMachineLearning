library(tidyverse)
mpg
diamonds


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group=1))

