# Installing New Packages #

install.packages(c("tidyverse", "readxl", "skimr", "nycflights13", "lubridate"))

        # tidyverse - main package for Data Science
        # readxl - read 'excel' file
        # skimr - summarize statistics
        # nycflights13 - New York flight data
        # lubridate - dealing with date & time easier
 

# String Manipulation - Find the Pattern 
## Using built-in data - state.name
state.name 

# (1) Function grep()
# is Pattern Matching and Replacement 

## (1.1) Find the word "South" in vector State.name
        # show element numbers (40, 41)
grep("South", state.name)

## (1.2)Find the word "South" in vector State.name
        # show the name of state 
grep("South", state.name, value = TRUE)

# Let's check 
state.name[40]
state.name[41]

## Find the word "New" in vector State.name
        # show the name of state 
grep("New", state.name, value = TRUE)

## (1.3)Find the word start with "A" in vector State.name
grep("A", state.name, value = TRUE)

## (1.4)If change "A" to "a",will find state that has "a"
        #  any position 
grep("a", state.name, value = TRUE)


##### Regular Expression #####

## (1.5) Using  ^ ( Caret ) = starts with...
              # ^M          = starts with M
grep("^M", state.name, value = TRUE)

## (1.6) Using  $ ( Dollar sign ) = ends with...
              # a$                = ends with a
grep("a$", state.name, value = TRUE)

## (1.7) Using  \\s  = find the words that has a space. 
grep("\\s", state.name, value = TRUE)        

## (1.8) Using [] ( Character class) for OR 
##           ^[AM] = starts with A or M
grep("^[AM]", state.name, value = TRUE)

## (1.9) [^ ] Caret in []  
##       ^[^AM] = start with any char., but not A or M
grep("^[^AM]", state.name, value = TRUE)




# (2.) grepl()  - get result TRUE / FALSE

## (2.1) Find the word "New" in vector State.name
# show "TRUE" in element that has "New" 
grepl("New", state.name)

# If we want to count how many words that has "New" 
# We can use sum() 
# TRUE = 1, FALSE = 0
sum(grepl("New", state.name))
        # result is 4



## Find the state that start with M    "^M"
# show "TRUE" in element that start with "M" 
grepl("^M", state.name)  

sum(grepl("^M", state.name))
        # result is 8




##### Using package from tidyverse ##### 
# for String Manipulation 

library(tidyverse)

# stringr 

## (1)str_detect() : check the pattern in the character. 

#  Are there "p" in the "python"?   - TRUE / FALSE
str_detect("python", pattern = "p")
                # result is TRUE

str_detect("python", pattern = "P")
                # result is FALSE     # case-sensitive

## Are there "New" in the data state.name ? 
str_detect(state.name, pattern = "New")                
                # result show TRUE / FALSE in each value
                # then, Using sum() to count 
sum(str_detect(state.name, pattern = "New"))
                # result is 4

## We also do Subset vector by using [ ] (Square-bracket)
# It will show the name of states where has "New" in it.
state.name [ str_detect(state.name, pattern = "New") ]


# (2)str_length() : count how many character in each name
str_length(state.name)


# (3)str_subset(): find the pattern 

## Find state that has "A" in State.name
str_subset(state.name, "A")


# (4)str_extract(): select pattern 

# to Keep car name into object "models" 
models <- rownames(mtcars)
models

# each car name will have Maker and number (Volvo 142E)
# select pattern from the models 
# If we want only number from each model - will use \\d
#    \\d   (d = digit)
str_extract(models, pattern = "\\d") 
                # result is one digit from model 
                # "Datsun 710" will show 7

str_extract(models, pattern = "\\d+")
        # result is "one or more" digit from model 
        # "Datsun 710" will show 710

