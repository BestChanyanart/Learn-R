## LIMIT Axes 
# to adjust x and y 

# When we plot the graph, sometime it will show Outlier
# and we don't want to show them in graph 

ggplot(mtcars, aes(wt,mpg)) + 
    geom_point(size=3)

# There are Outlier(x more than 5), and don't want to show
# we can use xlim(c( , )) 

ggplot(mtcars, aes(wt,mpg)) + 
    geom_point(size=3) + 
    xlim(c(2, 5))
# only show from 2 to 5 

# add ylim(c( , ))
ggplot(mtcars, aes(wt,mpg)) + 
    geom_point(size=3) + 
    xlim(c(2, 5)) + 
    ylim(c(20,30))