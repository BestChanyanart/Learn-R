## How to change COLOR 
library(tidyverse)

ggplot(mtcars, aes(wt,mpg)) +
    geom_point(size=3, color="salmon")

colors()         
    # show colors that R can do 

# R also know HEX color  
ggplot(mtcars, aes(wt,mpg)) +
    geom_point(size=3, color="#cea2de")

# How to map color in R 

ggplot(mtcars,
       aes(wt, mpg, color=am)) +
    geom_point(size=3)

# This is not appropriate bc. "am" is factor. (num 0 -1) 
# so, we need to change it into Factor first
glimpse(mtcars)
class(mtcars$am)

mtcars <- mtcars %>% 
          mutate_at(.vars = c("am","vs"),
              .funs = as.factor) 
glimpse(mtcars)

# Now, we can plot "am" as a factor into the graph.  
ggplot(mtcars,
       aes(wt, mpg, color=am)) +
    geom_point(size=3)

# If we bring "hp" as a numeric into graph. 
# It will show a color spectrum on the graph 
ggplot(mtcars,
       aes(wt, mpg, color=hp)) +
    geom_point(size=3)


# To change the color of variable in the graph 
# by adding scale_color_manual(values = )

ggplot(mtcars,
       aes(wt, mpg, color=am)) +
    geom_point(size=3) +
    scale_color_manual(values = c("red", "blue"))


# If hp is a numeric, graph will show as a color spectrum.
# So, we will use scale_color_gradient(), scale_color_gradientn()
ggplot(mtcars,
       aes(wt, mpg, color=hp)) +
    geom_point(size=3) +
    scale_color_gradient(low = "gold",
                         high = "red")

ggplot(mtcars,
       aes(wt, mpg, color=hp)) +
    geom_point(size=3) +
    scale_color_gradientn(colors = c("gold", "blue", "red"))                                   # low, median, high


# Using color palette
library(RColorBrewer)
display.brewer.all()


ggplot(diamonds, aes(cut, fill=color)) +
    geom_bar() +
    scale_fill_brewer(palette = "Sprectral")

    # we also search from web. colorbrewer2.org 
ggplot(diamonds, aes(cut, fill=color)) +
    geom_bar() +
    scale_fill_brewer(palette = "RdYlGn")


# To change Themes (Background) of graphs 
ggplot(diamonds, aes(cut, fill=color)) +
    geom_bar() +
    scale_fill_brewer(palette = "RdYlGn") +
    theme_minimal() +
    labs(title = "Bar plot count of diamonds",
         caption = "Source: diamonds dataframe")


# Using ggthemes 
library(ggthemes)
ggplot(mtcars, aes(wt, mpg)) + 
    geom_point(size=3) +
    theme_economist()

ggplot(mtcars, aes(wt, mpg)) + 
    geom_point(size=1) +
    theme_fivethirtyeight()



# Using plotly 
# To make graph interactive 
install.packages("plotly")
library(plotly)

p <- ggplot(mtcars, aes(wt, mpg, color=am)) + 
        geom_point(size=1)
ggplotly(p)    


p2 <- ggplot(diamonds, aes(cut, fill=color)) +
    geom_bar()
ggplotly(p2)

