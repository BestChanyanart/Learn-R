########## Data Wrangling
library(tidyverse)

# Data Cleansing == Clean data == Prep Data
# Using tidyr for clean NA (Missing Value)

x <- c(10, 20, 30, 40, NA, 100)

# (1) na.rm = TRUE 

mean(x, na.rm = TRUE)
                    # using na.rm = TRUE

is.na(x)            # check NA elements in x 

# (2) replace_na() - replace NA with new value

replace_na(x, 500)



starwars #built in Data Frame
glimpse(starwars)
        # There are 87 rows / 14 column 
        # but last three row are nested column
        # we need to remove it first before check na. 
        # using    -column name
starwars <- starwars %>% 
            select(- films, -vehicles, -starships)
glimpse(starwars)

# Let's check how many rows completed (no NA in it)

# (3) complete.cases() - check complete rows 
# if no NA (TRUE), if it has NA (FALSE)
complete.cases(starwars)
sum(complete.cases(starwars))
        # only 29 starwars characters has complete data

mean(complete.cases(starwars))
        # % completed cases = 33% (due to True = 1)


## Let's count how many Missing Value in each Column
## by writing our own Function to count NA in a vector

check_na <- function(x) {
    sum(is.na(x))
}

check_na( c(1:5, NA, 10, NA, NA))

# Let's apply check.na func. to every column in Starwars 
## by using Summarize_all() 

starwars %>% 
    summarise_all(.funs = check_na) %>% 
    as.data.frame()

# Let's clean column Mass
# by replacing NA with mean "Mean Imputation"

starwars$mass
mean_mass <- mean(starwars$mass, na.rm = TRUE)
mean_mass
                # mean = 97.31
replace_na(starwars$mass, mean_mass)
starwars$mass <- replace_na(starwars$mass, mean_mass)

# Let's check column complete again  !!!
starwars %>% 
    summarise_all(.funs = check_na) %>% 
    as.data.frame()
                # Mass column: NA = 0

# Let's clean hair_color column 
starwars$hair_color

# Check Mode of Hair color 
starwars %>% count(hair_color, sort = T)
        # (Mode) none = 37 
        # NA = 5 
        # Maybe let's assume NA == none (no hair color)

replace_na(starwars$hair_color, "none")
starwars$hair_color <- replace_na(starwars$hair_color, "none")

# Let's check column complete again  !!!
starwars %>% 
    summarise_all(.funs = check_na) %>% 
    as.data.frame()
                # Hair_color column: NA = 0

## (4) drop_na() - to drop/delete row that has NA 
# but it's not useful if there are a lot of NA
# we will lost too much data for analyzing 

drop_na(starwars)
starwars_clean <- drop_na(starwars)
