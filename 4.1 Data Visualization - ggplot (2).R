install.packages(c("rmarkdown", "knitr", "gapminder", "corrplot", "viridis"), dependencies=TRUE)

library(tidyverse)
# Visualization (part2) 
# 1. Time-series Data (column: date, year,...)

#Time-series of gdpPercap (Group by Continent)
gapminder   #built in data set
    # This data has 1704 record from 142 countries, 5 continent for       12 years 
    # So, we will close up at Oceania continent (there are 2             countries)

oceania<- gapminder %>%
    filter(continent == "Oceania") %>%
    select(continent, country, year, lifeExp, gdpPercap)

    # we want to make chart as Time-series, so x=year and y=gdp
ggplot(data=oceania, 
       mapping =aes(x=year, y=gdpPercap, 
                    group = country,
                    color = country)) +
    geom_line(size=2, alpha = 0.5)


# 2. Overplotting 
diamonds   # built-in data set
glimpse(diamonds)
        # columns: cut, color, clarity are Ordinal Factor
diamonds$cut

# Let's check Carat x Price 
ggplot(diamonds, aes(carat, price)) +
    geom_point()

            # It's took a long time to get the chart! Why?
            # Because there 54,300 obs. 
            # and it try to point each obs. on chart 
            # Data are pile up and over on it 
            # we called 'Over plotting'
            # Let's try to adjust and make it look better!

ggplot(diamonds, aes(carat, price)) +
    geom_point(alpha=0.1)
            # alpha=0.1 - look better, can see pattern 
            # but still slow 

ggplot(diamonds, aes(carat, price)) +
    geom_point(alpha=0.4, shape=".")
            # change the shape to small dot . 

# If we get only sample size ? just n = 5,000 
    # sample_n() function - random number

diamonds %>% sample_n(5)   # get 5 samples

set.seed(123)              # set.seed() for lock sample n
diamonds %>% sample_n(5)

set.seed(123)             
small_diamond <- diamonds %>% sample_n(5000) # n = 5,000
glimpse(small_diamond)

ggplot(small_diamond, aes(carat, price)) +
    geom_point(alpha=0.1)     
                            # n lessen - it's faster!

# If we change the chart? - using geon_bin2d()
ggplot(small_diamond, aes(carat, price)) +
    geom_bin2d(bins = 10)
                    # Wow! It's really fast
    # bins is the square on the plot 
    # if we adjust bins = 10 means the graph has 10*10 sqr.
    # Data will put into the bins 
    # it will shows density of data in each bins by color 

ggplot(diamonds, aes(carat, price)) +
    geom_bin2d(bins = 100)         
                        # n ~ 50,000 it's still fast !!

## 3. facet - separate the graph according to value

small_diamond %>% count(color)
levels(small_diamond$color)
    # there are 7 colors:   "D" "E" "F" "G" "H" "I" "J"

p <- ggplot(small_diamond, 
            aes(carat, price)) 

p + 
    geom_point(size = 0.1) + 
    facet_wrap(~color, ncol = 4 )
    # (~color)separate to 7 graphs according to each colors
    # (ncol = ) show how many graphs in each row

p + 
    geom_point(size = 0.05) +
    facet_grid(color ~ clarity)
    # facet_grid: create grid table by crossing 2 var. 
    # crossing with color  and clarity (factor variable)

p + 
    geom_point(size = 0.05) +
    geom_smooth() +
    facet_grid(color ~ clarity)
    # add more layer geom_smooth()




