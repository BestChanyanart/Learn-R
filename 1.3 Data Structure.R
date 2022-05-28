##### DATA STRUCTURE ##### 
       
        # 1. vector
        # 2. list
        # 3. matrix
        # 4. data frame

# 1. VECTOR
# all value in Vector need the "same" data type.
# Vector can't combine Char and numeric .... 


a <-  c(1, 2, 3, 4, 5) # c = "concatenate" 
b <-  c(1, 0, 0, 1, 0)
a + b    
#result 2  2  3  5  5
# addition in each column if range are the same
# "Vectorized Operation"

vec1 <- 1:10 
vec2 <- rnorm(100)
# rnom is generate random number 
# from a normal distribution (mean=0, sdt = 1)
vec2        

rep(c(1,2,3), 10)   
# rep is "replicate" 
# repeat 1,2,3 for 10 times

?rep 
# ? :function Help for showing R Document or using
help("rep")

seq(0, 100, by=5)
# seq is "Sequence Generation"
# generate regular sequences 
# ex. generate 0 - 100 by 5s (increasing 5 times)

z <- runif(100)
z
# runif()is "The Uniform Distribution"
# generate value randomly with equal probability

# Vector is not only for numeric 
# but can be Logical and Char

#Logical Vector 
c(TRUE, FALSE, FALSE)
c(T, F, F)

#Character Vector 

names <- c("Beckham", "Ronaldo", "Messi", "Toys", "Boom")

# How to SUBSET Vector #     #Using []

## Subset by Position 
names[1] 
names[2]
names[1:3]

## Subset by Conditions
ages      <- c(35, 32, 30, 29, 22)
ages[ages <= 30 ]
ages <= 30 
#FALSE FALSE  TRUE  TRUE  TRUE
names[ages <= 30]
# "Messi" "Toys"  "Boom" 

## Subset by Logical 
is_stem_classes <- c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)
homework_grades <- c(87, 81, 95, 86, 85, 90, 88)

preffered_homework_grades <- homework_grades[is_stem_classes]
preffered_homework_grades

# How to remove Vector by using index 
homework_grades <- c(87, 81, 95, 83, 86, 79, 88) 
homework_grades[-7]  ## 88 is removed
above85 <- homework_grades[c(-2,-4,-6)] #81,83,79 is removed.
above85

# How to name the vector if we already had prepared Vector 
# Using names() function 

exam_grades <- c(92, 90, 84, 95, 77, 92, 85)
homework_grades <- c(87, 81, 95, 86, 85, 90, 88)
project_grades <- c(85, 92, 79, 93, 90, 91, 95)
class_names <- c("Math", "Chemistry", "Writing", "Art", "History", "Music", "Physical Education")

names(exam_grades) <- class_names 
names(homework_grades) <- class_names 
names(project_grades) <- class_names

exam_grades
homework_grades
project_grades

# 2. LISTS

names    <- c("Beckham", "Ronaldo", "Messi")
ages      <- c(35, 32, 30)
clubs    <- c("ManU", "Madrid", "Barca")
retired  <- c(TRUE, FALSE, FALSE)

#now I have 4 object, I will put 4 objects into 1 List. 
my_list <- list(names, 
                ages, 
                clubs, 
                retired)
my_list

# we can rename objects which showing in console
# [1] renames player_names
# [2] renames player_ages
my_list <- list(player_names   = names, 
                player_ages    = ages, 
                player_clubs   = clubs, 
                does_he_retire = retired)
my_list



# 3. MATRIX 

matrix(1:9, nrow = 3) # order number col (top to bottom)
matrix(1:9, nrow = 3, byrow = TRUE) # order number row
# (left to right)


#To assign it into new obj. 
my_mat <- matrix(1:9, nrow = 3, byrow = TRUE)



#To rename 'each column' and 'each row'
colnames(my_mat) <- c("A", "B", "C")
rownames(my_mat) <- c("row1", "row2", "row3")
my_mat



#cbind: column bind 2 obj. stick to each other
cbind(my_mat, my_mat)

#rbind: row bind
rbind(my_mat, my_mat)
# ***For binding, need to equal row and column  

#Update Values in Matrix ("Element-wise Computation")
my_mat + 1
my_mat * 2

my_mat2 <- my_mat * 100
my_mat2


# 4. DATA FRAME

cities      <- c("BKK", "TOKYO", "LONDON")
countries   <- c("TH", "JPN", "UK")
population  <- c(1000000, 2000000, 2500000)

cities
countries
population

#To create Data Frame 
data.frame(cities,
           countries,
           population)

my_df <- data.frame(cities,
                    countries,
                    population)
my_df

#built-in data frame
data()

#call data frame
data("mtcars")
mtcars


head(mtcars)
tail(mtcars)

#To check data - how many row and column (Dimensions)
dim(mtcars)

#To preview "structure" of data 
str(mtcars)

#To calculate basic stat (min, max, mean, ...)
summary(mtcars)