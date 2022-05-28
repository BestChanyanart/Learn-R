# Homework3 
library(tidyverse)
library(gapminder)
library(viridis)
glimpse(gapminder)

p <- gapminder %>% 
    filter(year %in% c(1997, 2007)) %>%
    ggplot(aes(lifeExp, gdpPercap, color = continent, 
               size= pop)) +
        geom_point(alpha = 0.5)+
        facet_wrap(~year) +
        theme_minimal() +
        labs(title="Comparison between 1997 and 2007",
            x = "Life Expectancy(year)",
            y = "GDP per Capita",
            caption = "Source: Gapminder dataframe") +
    scale_size(range = c(.1, 20)) + 
    guides(size = FALSE) +
    scale_color_viridis(discrete = TRUE)

library(plotly)
ggplotly(p)


## Bubble size - small(0.1), large(20)
# scale_size(range = c(.1, 20))  