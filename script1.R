install.packages("tidyverse",dependencies = TRUE)
#Here is comment

#  R script is "Reproducible"
#  CTRL + L         =    Clear Console
#  CTRL + ENTER     =    Execute Code/Script
#  CTRL + SHIFT + N =    Open New Script
#  CTRL + arrow Up/Down = Show History in Console

#   <-      "assign" the variables

income <- 26000
expense <- 19000
saving <- income - expense

print(saving)
saving

# *** (1) How to name the Variable ***
# 1. Lowercase
# 2. Not start with Number 
# 3. Using snake-case (_) for many words e.g. my_name

name <- "Chanyanart"
surname <- "KiattipornOpas"
my_age <- 26
is_girl <- TRUE

# *** (2) Data type ***
# 1. Characters (char) - "  "
# 2. Numeric           - number
# 3. Logical           - TRUE/T  FALSE/F
# 4. Integer (Int)

# How to check Data type 
class(name)
class(is_girl)
class(my_age)


# *** (3)Data Structures ***
#   1. Vector
#   2. Matrix
#   3. Data frame

#### 1. Vector 
c <- 1:10
(x <- 1:10)
(y <- c(100, 200, 400))

# how to remove variable rm(x) into Console

fruit_name <- c("Apple", "Orange", "Mango", "Pineapple")
(fruit_name)
price <- c(20, 25, 35, 50)
(price)
favors <- c("sweet", "sweet & sour", "sour", "sour")
is_sour <- c(F, T, T, T)

# Count Values 
length(favors)

#### 2. Matrix 
matrix(1:25, nrow = 5) #???????????????????????????????????? ????????? default
matrix(1:25, nrow = 5, byrow = TRUE) #byrow ?????????????????????????????????

m1 <- matrix(1:25, nrow = 5, byrow = TRUE)
m2 <- matrix(1:6, nrow = 2, ncol = 3)

# Add Number into it "Element mWise Computation"
m2 
m2 + 5

price + 10
new_price <- price + 10
new_price

# Update Value into Matrix (Start index from 1)
# e.g. Want to update from 4 to 40
# will use SUBSET []

m2
m2[2,2]
m2[2,2] <- 40
m2


#### 3. Data Frame

fruit_name <- c("Apple", "Orange", "Mango", "Pineapple")
price <- c(20, 25, 35, 50)
favors <- c("sweet", "sweet & sour", "sour", "sour")
is_sour <- c(F, T, T, T)

data.frame(fruit_name,
           price,
           favors,
           is_sour)

df <- data.frame(fruit_name,
                 price,
                 favors,
                 is_sour)

# Dollars sign $ for pull out Variable in  Data Frame
df$fruit_name
df$favors
df$is_sour

# How to Import file csv. (data set)
# 1) put csv file in the same folder (working directory)
# 2) at Environment: Go to Import Dataset and From Text
# 3) choose the csv file 

# Show the first 6 objects of data
#      head()            <<< put csv name
#      head( name , 10)  <<< show first 10 object

# Show the last 6 objects of data 
#      tail()            <<< put csv name
#      tail( name , 10)  <<< show last 10 object

# Show how many column in this Data set (structure: str)
#      str()             <<< put csv name

### Install package 
#      install.packages(tidyverse)

### Call for package before using everytime
#      library(tidyverse) 
library(tidyverse)


###Practicing with Dataset named "mtcars"<type in console
head(mtcars)
head(mtcars, 10)
tail(mtcars, 10)

# Select Column to show 
    select(mtcars, 1:3) # show 3 column 
    select(mtcars, mpg, hp, wt, am)

# or Using pipe sign    %>%    and Filter

mtcars %>%
  select(mpg, hp, wt, am) %>%
  filter(mpg > 30)


####Visualization (Using qplot)

qplot(x = mpg, data = mtcars, geom = "histogram")

qplot(x = mpg, data = mtcars, 
      geom = "histogram", bins = 20)

qplot(x = mpg, data = mtcars, 
      geom = "histogram", bins = 10)

qplot(x = mpg, data = mtcars, 
      geom = "histogram", bins = 5)

qplot(x = mpg, data = mtcars, 
      geom = "density")

qplot(x = hp, y = mpg, data = mtcars,
      geom = "point") #scatter plot

qplot(x = hp, y = mpg, data = mtcars,
      geom = "point") + 
  theme_minimal() +               #change theme / bg
  geom_smooth(method = "lm")      # "lm" Linear Model

qplot(x = hp, y = mpg, data = mtcars,
      geom = "point") + 
  theme_minimal() +               
  geom_smooth()      

### ggplot 

ggplot(data = mtcars, 
       aes(x=hp, y=mpg)) + 
  geom_point(size = 3, col = "Salmon") +
  geom_smooth(se = FALSE, col = "black") +
  theme_minimal() +
  labs(title = "My First Scatter Plot",
       subtitle = "Hello World",
       x = "Horse Power (hp)", 
       y = "Miles per Galon (mpg)")

#### Missing Value (N/A) 
# How to count N/A in each column 
# Using Starwars dataset
       
      # (1) 1 means rows, 2 means columns 
      # (2) Write new function named x 
      # (3) Using       sum()    for counting 
      # (4) Counting    is.na()

starwars
apply(starwars, 2 , 
      function(x) sum(is.na(x)))



