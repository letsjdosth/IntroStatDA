library(ggplot2)
head(mpg)


ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()
# 2 layers: data-mapping and points
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point(color="blue")


ggplot(mpg, aes(x=displ, y=cty, color=class)) + geom_point()
#class: categorical


#faceting
#(by class)
ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~class)

# other geom functions
?geom_smooth
?geom_boxplot
?geom_histogram
?geom_freqpoly
?geom_bar
?geom_path
?geom_line

ggplot(mpg, aes(x=displ, y=hwy)) + geom_point() + geom_smooth() #default: lowess
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point() + geom_smooth(span=0.2)
ggplot(mpg, aes(x=displ, y=hwy)) + geom_point() + geom_smooth(method="lm")


#categorical variables
ggplot(mpg, aes(drv, hwy)) + geom_point()
ggplot(mpg, aes(drv, hwy)) + geom_jitter()
ggplot(mpg, aes(drv, hwy)) + geom_boxplot()
ggplot(mpg, aes(drv, hwy)) + geom_violin() #density estimate


#histogram
ggplot(mpg, aes(displ, color = drv)) + geom_freqpoly(binwidth = 0.5)
ggplot(mpg, aes(displ, color = drv)) + geom_histogram(binwidth=0.5, alpha=0.6) + facet_wrap(~drv, ncol=1)


#labels
?xlab
?ylab
?labs
?ggtitle

#axis
?coord_cartesian

#globally
?theme
?theme_gray



#maps
library(maps)
library(ggmap)
