library(tidyverse)

class(mtcars)

######## Function tibble ########

# start learning from tibble -make data frame good looking
# Let's change mtcars to tibble
mtcars <- as_tibble(mtcars)
mtcars
class(mtcars)
            # "tbl_df"     "tbl"        "data.frame"

# Tibble make Data frame looks good ! 
# suggest to change df to tibble when Import df every time

# default - shows 10 rows and, show data type
# it will adjust column according to Console size 


######## Function glimpse ########

# same as str() but glimpse() look more beautiful. 
glimpse(mtcars)

     
####### Create tibble from scratch 
tibble(
    emp_id = 1:5, 
    emp_name = c("Toy", "Top", "Bee", "Wan", "Ink")
)

employees <- tibble(
    emp_id = 1:5, 
    emp_name = c("Toy", "Top", "Bee", "Wan", "Ink")
)

employees

######## Function tribble ########

tribble(
    ~emp_id, ~emp_name, 
    1, "Toy",
    2, "Top",
    3, "Bee",
    4, "Wan",
    5, "Ink"
)

employees2 <- tribble(
    ~emp_id, ~emp_name, 
    1, "Toy",
    2, "Top",
    3, "Bee",
    4, "Wan",
    5, "Ink"
)
employees2




