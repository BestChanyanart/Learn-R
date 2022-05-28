# Data Wrangling with dplyr (Part One)
# Main 5 functions of dplyr 
            ## 1. select
            ## 2. filter 
            ## 3. arrange
            ## 4. mutate 
            ## 5. summarize 

library(tidyverse)
mtcars
head(mtcars)       # or
mtcars %>% head()


sum(1:5)        # or
1:5 %>% sum()

# 1. select() function 
select(mtcars, mpg, hp, wt)  # or
mtcars %>% select(mpg, hp, wt)    # select by column name 

mtcars %>% select(1:5)            # select by index 
mtcars %>% select(mpg:hp)         

mtcars %>% select(starts_with("a"))
                # select column that starts with a 

mtcars %>% select(ends_with("p"))
                # select column that ends with p 

mtcars %>% select(contains("a"))
           # select column that has "a" in column name

mtcars %>% select(horsePower = hp,
                  weight = wt)         # rename column 


mtcars %>% select(gear, everything())
           # move column "gear" to show first 
           # everything() - select other column left


# 2. filter() function 
mtcars %>% filter(hp < 100)
mtcars %>% filter(cyl == 6)

## more than one condition 

#           ( AND & )
mtcars %>% filter(hp < 100 & am == 1)
                
mtcars %>% 
    select(hp,am) %>%
    filter(hp < 100 & am == 1)

#           ( OR | )
mtcars %>% 
    select(hp,am) %>%
    filter(hp < 100 | am == 1)

#           (BETWEEN AND   %in%  )
mtcars %>% 
    filter(hp %in% 100:150)    # hp from 100 - 150


#           (BETWEEN AND   %in% c( )  )
mtcars %>% 
    filter(cyl %in% c(4,8))    
    # cyl has 4,6,8 but need only 4 and 8 (Not 6)


# 3. arrange() function -  sort data / ORDER BY

mtcars %>% 
    arrange(hp)           # from low to high (ascending)

mtcars %>% 
    arrange(desc(hp))     # from high to low (descending)


# 4. mutate() function -  create new column to the right
mtcars %>% 
    select(hp) %>%
    mutate(hp_2 = hp * 2)

                            # create new three column
mtcars %>% 
    select(hp) %>%
    mutate(hp_2 = hp * 2,
           hp_log = log(hp),     
           hp_exp = exp(log(hp))) 
                   

# 5. summarise() function - calculate basic stats

mtcars %>% 
    summarise(
        avg_mpg = mean(mpg), 
        sd_mpg = sd(mpg),
        n = n()
    )
                # check sample in df:  n() = nrow(mtcars)


## We also do Group Statistics
# e.g. am column: Transmission 0 = Auto , 1 = Gear Manual 
mtcars
class(mtcars$am)
                # class: Numeric

# Actually should be Factor if we want to do a Group stat
mtcars <- mtcars %>% 
          mutate(am = factor(am, 
                         levels = c(0,1),
                         labels = c("Auto", "Manual")))

class(mtcars$am)
                # class: Factor

# table() - make CrossTab table to count Frequency
table(mtcars$am)
     
# create prop table (% percentage)
(table(mtcars$am) / nrow(mtcars)) * 100


# 6. Grouped Statistics 
# group_by() for categorize the group 
# group_by() function - use with Factor class

mtcars %>% 
    group_by(am) %>%
    summarise(
        avg_mpg = mean(mpg), 
        sd_mpg = sd(mpg),
        n = n()
    )

## another example
class(mtcars$vs)
                # class: Numeric
mtcars$vs


# change class without using mutate
# overwrite on the data 
mtcars$vs <- factor(mtcars$vs,
                    levels = c(0,1),
                    labels = c("Vshaped", "Straight"))

class(mtcars$vs)            
                # class: Factor

table(mtcars$vs) / nrow(mtcars)
(table(mtcars$vs) / nrow(mtcars)) * 100

# We also do Group_by() more than 1 column 
mtcars %>% 
    group_by(am, vs) %>%
    summarise(
        avg_mpg = mean(mpg), 
        sd_mpg = sd(mpg),
        n = n()
    )


# 7. count() function - create frequency table
# create proportion table
mtcars %>% 
    count(am)

mtcars %>% 
    count(am, vs)


mtcars %>% 
    count(am) %>%
    mutate(pct = n/sum(n))   # percentage each group



