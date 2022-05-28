library(tidyverse)

#  "Tidy "Data" concept
#     - Column: keep only 1 data type (variable)
#     -  Row: data of each observations/unit  
#     - Value: each cell has an appropriate value

## 1. Long format (appropriate for doing Data analysis)
## 2. Wide format 


world_bank_pop
glimpse(world_bank_pop)
            # 20 columns (wide format)

## Tidy Data Format (Pivoting) ##
# (1) Changing Wide to Long format #

# (1.1) gather() - gather many column and make new column 
long <- world_bank_pop %>% 
            gather(`2000`:`2017`,     # gather columns 
            key = year,        # make new col. named year
            value = value)     # value of that column
                              # It has 4 columns now !!
# (1.2) pivot_longer()
# same as gather() function but NEW !!! 
# and performance is better for very Big Data
world_bank_pop %>% 
    pivot_longer(`2000`:`2017`,
                 names_to = "year",
                 values_to = "value")

# (2) Changing Long to Wide format #

# (2.1) spread() 
long %>% 
    spread(key = year,
           value = value)
        # It back to 20 columns now !!


# (2.2) pivot_wider()
# same as spread() function but NEW !!! 
# and performance is better for very Big Data

long %>% 
    pivot_wider(names_from = "year",
                values_from = "value")

# (3) Separate - to split column 
table3      # built in data set: Ebola patient cases
            # There are 3 column; country, year, rate
            # but rate column has a "/" for  patient/pop.
            # so, we need to split and make new col. 
table3 %>% 
    separate(col = rate,
             into = c("cases", "pop"),
             sep = "/")

# (4) Unite - to combine column 
table5          # built in data set
                # There are 4 column; 
                # but it split into Century and Year 
                # we need to combine/unite it 
table5 %>% 
    unite(newColumn, century, year)
                # but it split by underscore _

table5 %>% 
    unite(newColumn, century, year,
          sep = "")

# Let's do both Unite() and Separate()
table5 %>% 
    unite(newColumn, century, year,
          sep = "") %>%
    separate(rate, into = c("cases", "pop"))

# Now, column NewColumn, cases and pop is Character
# Let's convert to Numeric
# by using Mutate_at() - do many column in the same time

table5 %>% 
    unite(newColumn, century, year,
          sep = "") %>%
    separate(rate, into = c("cases", "pop")) %>%
    mutate_at(.vars = c("cases", "pop"),
              .funs = as.double)



