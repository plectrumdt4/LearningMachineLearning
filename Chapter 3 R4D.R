# R for data science
# Chapter 3
# Data visulisation

library(tidyverse)

#plot mps graphs

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#Ex 3.2.4
#1
ggplot(data = mpg) # nothing

#2 number of rows and colmumns
dim(mpg) # 234 rows and 11 columns
str(mpg)

#3 drv variabledescribe?
?mpg # whether its a font, rear or four wheel drive

#4 hwy versus cyl scatter
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#5 male a class versus drv scatter
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv))
# not useful because class and drv are non numeric


# Exercise 3.3.1
#1 becuase the colour has been set inside the aes argument
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#2 which variables are categorical
#model, manufacturer, cyclinder..., drv, fl andd class
#check which are non-numeric through
str(mpg)



#3 map contnuous variable to colour shape and size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour= displ))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape= displ))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,size= displ))

# the colour or size is graduated as opposed to distinct and the same type
# Can't map a contnuous variable to shape


#4 map same variable to aesthetic

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,size= displ, colour = displ))

#the colour and the shape are both graduated

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,size= class, colour = class))

# for the catgeoricl both are made discrete

#5 what does stroke do?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, stroke = displ))


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, stroke = cty))
#changes the size of the points but doesn't produce a legend

#6 map an aesthetic to a logic argument

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = displ<5))

#creates  logical argument for colour and colours one side by the logic specified

#Exercise 3.5.1
#1 what happens if you facet by a contnuous variable?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
               facet_wrap(~displ)

#it will facetbut on every single continuous 

#2 what do empty cells mean in the below
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))+
  facet_grid(drv ~ cyl)
#empty cells indicate where there is no type of value for cyl or drv that correspond
#with eachother.

#3 what does the following code make? what does. do?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

# . facets by rows or columns for facet grid. 
#The first plot is  engine size by highway broken down by driver
# the second plot by cylinder either the x or the y axis are all the same
# depending on if you choose to facet by row or colum, x or y

#4. what are the advantages of faceting for the following
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
# it allows us to see how each of the variables relate to eachother in different conditions
# so the realtion between x and y for each type of car whcih is hidden by aestetics
# the disavdantage is the data is some data is too small to infer a relationship
# hence a bigger data set would be useful (for two seaters for instance)

#5. read ?facet_wrap
?facet_wrap
#nrow and ncol tell the plot window the number rows or columns to plot into
# other options for controlling layout are scales, swtich, as.table, drop and direction
# facet grid doesn't have nrw and ncol because it divides the rows or columns based
# on the the number of discrete entities parsed

#6. You put the variable with more unique items in the column because
# otherwise the display would become extremely stretched and be difficult to read


#Exercise 3.6.1

#1. to draw
# line chart = geom_line, boxplot = geom_box, histogram  geom_hist and area= geom_are


#2. will produce a scatter plot displ versus highway coloured by drive and a smoothing line
# the smoothing line will not have confidence intervals

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)
# I guess because the colour aesthetic has been parsed it's created three different lines

#3 show.legend = FALSE removes the legend from the allocated geom 
# removed earlier because it would of shown legend for dinal graph

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)


ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv)  )

# 4 the se argument corresponds to the standard error and the confidence intervant around our model

# 5. the two graphs will look the same as they are both using the same argument
#in one the variables are passed to the global and in the other the local

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()


              
#6. recreate code to generate the plots

#a
ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

#b
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(mapping = aes(group = drv))

  
#c
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) + 
  geom_point() + 
  geom_smooth()

#d
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = drv)) + 
  geom_smooth()

#e
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) + 
  geom_point() + 
  geom_smooth(mapping = aes(linetype = drv))
       
#f
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) + 
  geom_point(stroke = 3, colour = "white") +
  geom_point()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, fill = drv)) + 
  geom_point(stroke = 2, colour = "white", shape = 21) 


#Exercise 3.7.1

#1 the default geom is "geom_pointrange"

?stat_summary

# the code can be rewritten as

# we have to write the fu .y bit if we want to use the median
ggplot(data = diamonds) + 
  geom_pointrange(mapping = aes(x = cut , y = depth), stat = "summary", fun.y = median,
                  fun.ymin = min, fun.ymax = max)


#geom col 

ggplot(data = diamonds)+
geom_col(mapping = aes(x = cut)) 

#2 there is no geom_col.. so nothing unless later release then look like it uses stat identity as opposed to count

#4. what does stat_smooth compute?
?stat_smooth
# stat_smooth is related to geom_smooth
#by default it fits a loess curve to the data
# it computes a predicted y and the upper and lower y based on confidence intervals
#which are derived from the standard error.

#5 what the problem with these graphs

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group =1))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))

#if you don't set group the whole of the column will be filled up 
# the proportion are caulated within group as opposed to against eachother.


##Exercise 3.8.1

#1 The plot is showing many poitns overlapping ti can be improved with:

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter()

#2 
?geom_jitter
#the arguments that comntrol the jitterin are height and width

#3compare and contrast geom_count
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_count()

#geom count creates a binning for the data and sizes the data at location by those bins
#defaults to ascending order. The stat here is summary.

#4 what's the position adjustment for geom_boxplot?

?geom_boxplot

#automatically defaults to dodge and his it's own stat

ggplot(data = mpg, mapping = aes(x = manufacturer, y = hwy)) + 
  geom_boxplot()

#We note Honda vehciles have the most highway miles per gallon on average.


## Exercise 3.9.1

#1 turn stacked bar chart into a polcar chart

ggplot(data = mpg, mapping = aes(x = manufacturer, y = hwy, fill = manufacturer)) + 
  geom_bar(stat = "identity")+
  coord_flip()

ggplot(data = mpg, mapping = aes(x = manufacturer, y = hwy, fill = manufacturer)) + 
  geom_bar(stat = "identity")+
  coord_polar()
 
 #2 labs() allows you to give your plot a title and rename you x and y axis

#3 The difference between coord_map() and coord_quickmap is
# coord_quickmap is faster but at the expense of using a correct projection


#4
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()

#this plot tells us the relationship between hwy and cty is positive. 
#coord_fix makes sure the number of units on the y axis related the number of units
# on the x axis for display purposes.
#coordfix helps display the relationship more accuratley as opposed to being stretched

?geom_abline
?coord_fixed
