## Heatmap 
library(viridis)
diamonds %>% 
    count(cut, color)
# it will show 3 column: cut, color, n 
# We need 3 column to make Heatmap 
# x = cut, y = color, n = value 

diamonds %>% 
    count(cut, color) %>% 
    ggplot(aes(cut, color, fill = n)) +
    geom_tile() 


# Let's change the color by using Viridis
# scale_fill_viridis(discrete = FALSE)
# discrete(=Is factor?) 
# but n is numeric, so discrete = FALSE

diamonds %>% 
    count(cut, color) %>% 
    ggplot(aes(cut, color, fill = n)) +
    geom_tile() +
    scale_fill_viridis(discrete = FALSE)

# High = Yellow, Low = Puple 
# Can we swap the color? 

diamonds %>% 
    count(cut, color) %>% 
    ggplot(aes(cut, color, fill = n)) +
    geom_tile() +
    scale_fill_viridis(discrete = FALSE,
                       direction = -1) # reverse color
