library(tidyverse)
library(ggplot2)

# Two things that needs to consider before choose Chart
        # 1. Number of Variables
        # 2. Data Type 


#Basic chart Knowledge
#  - One quantitative variable: geom_histogram,        
#                           geom_density, geom_boxplot
#  - One factor variable: geom_bar
#  - Two Quantitative variables: geom_point, geom_smooth
#                               geom_density2d
#  - Two factor variables: geom_bar


# Basic ggplot2  - has main 3 elements 
#   1. data - data frame 
#   2. aesthetic (mapping) - column to map with the chart
#   3. geom (geometry)  - chart 

ggplot(data = mtcars, 
       mapping = aes(x = wt, y = mpg)) + 
    geom_point()


ggplot(data = mtcars, 
       mapping = aes(x = hp)) +
    geom_histogram()

ggplot(mtcars, aes(hp, wt)) + 
    geom_point()              # make it shorter syntax


# 1. One variable quantitative 
ggplot(mtcars, aes(mpg)) +
    geom_histogram(bins = 10)

ggplot(mtcars, aes(mpg)) +
    geom_density()

ggplot(mtcars, aes(mpg)) +
    geom_boxplot() +
    coord_flip()                  # flip the boxplot

        # boxplot can show Outlier (dot),Q1-Q4, min-max
  min(mtcars$mpg)
  quantile(mtcars$mpg, probs = 0.25) # Q1 
  quantile(mtcars$mpg, probs = 0.50) # Q2
  quantile(mtcars$mpg, probs = 0.75) # Q3 
  max(mtcars$mpg)

  fivenum(mtcars$mpg) # Tukey Five Number Summary 

  # How to detect Outliers 
  #  value   > Q3 + 1.5*IQR 
  #          < Q1 - 1.5*IQR
  # 
  #  find IQR by using func. IQR()  ,or IQR = Q3 - Q1
  IQR(mtcars$mpg)    # 7.375
  
  fivenum(mtcars$mpg)  # 10.40 15.35 19.20 22.80 33.90
                       # min,  Q1, Median/Q2, Q3, Q4
  
  # If Value > ....(below)...    means outlier 
  22.80 + 1.5*IQR(mtcars$mpg) 
        # 33.8625  
  # If Value < ....(below)...    means outlier 
  15.35 - 1.5*IQR(mtcars$mpg) 
        # 4.2875
  #  "33.9"(Q4) > 33.8625   means 33.9 is outlier
 
 
# 2. One variable qualitative (Factor)
ggplot(mtcars, aes(factor(am))) + 
    geom_bar()

# 3. Two variable quantitative
ggplot(mtcars, aes(wt, mpg)) +
    geom_point()

        # Can find correlation by using cor()
         cor(mtcars$wt, mtcars$mpg)
        # -0.8676594 (High correlated, Negative)

ggplot(mtcars, aes(wt,mpg)) + 
    geom_density2d() +
    geom_point()


ggplot(mtcars, aes(wt, mpg)) + 
    geom_point() +
    geom_rug()

ggplot(mtcars, aes(wt, mpg)) +
    geom_point() +
    geom_smooth() 

    # geom_point is regression model 
    # we also adjust from curve to straight line 
    # by put geom_smooth(method = "lm")  linear Model

ggplot(mtcars, aes(wt, mpg)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) 
    
    # se = standard error // we can hide it: se = FALSE 

    ## ggsave() - to save chart that is showing 
    ggsave("Plot/myFirstPlot.png")
    #   "folder name / create file name" 

    ggsave("Plot/myFirstPlot2.png", 
       width = 10, height = 5, units = "cm")


# 4. two variable qualitative (factor)

glimpse(mtcars)
# From data column vs and am, now are double (number)
# so, we need to change it to Factor first 

mtcars$am <- factor(mtcars$am, 
                    levels = c(0,1),
                    labels = c("Auto", "Manual"))

mtcars$vs <- factor(mtcars$vs, 
                    levels = c(0,1),
                    labels = c("Vshaped", "Straight"))
glimpse(mtcars)

ggplot(mtcars, aes(am, fill=vs)) +
    geom_bar()

        # fill = ...  is argument in aes() 
        # it means that fill "vs" data on "am" 

mtcars %>% 
    count(am,vs) %>%
    group_by(am) %>%
    mutate(pct = n/sum(n))

ggplot(mtcars, aes(am, fill=vs)) +
    geom_bar(position = "fill")
        
    # position = "fill" means change n to percentage
    # position = "dodge" means put bar next to it
ggplot(mtcars, aes(am, fill=vs)) +
    geom_bar(position = "dodge")

###### Setting vs. Mapping ######

#Setting - adjust characteristic of chart (size, color)
#        - adjust at geom 

ggplot(mtcars, aes(wt, mpg)) + 
    geom_point(size = 5, color = "red", 
               alpha = 0.5)
    
    # setting: size, color, alpha(transparent 0 - 1)


# Mapping  - column in dataframe mapped in aes function 
#          - adjust at aes(... , ..., color =  )
ggplot(mtcars, aes(wt, mpg, color=am)) + 
    geom_point()
                    # mapped by color 

ggplot(mtcars, aes(wt, mpg, shape=am)) + 
    geom_point()
                    # mapped by shape

ggplot(mtcars, aes(am, fill=vs)) +
    geom_bar()
                    # mapped by fill 

###### Set labels for our chart ######

p <- ggplot(mtcars, aes(wt, mpg, color=am)) + 
    geom_point(size = 3, alpha =0.7) 

p + 
    labs(title = "My first scatter plot",
         x = "Weight",
         y = "Mile per gallon",
         subtitle = "Both variables are negatively correlated",
         caption = "Source: mtcars dataframe")


