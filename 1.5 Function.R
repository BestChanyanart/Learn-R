##### FUNCTIONS ###### 

#These are FUNCTIONS 
seq(0, 100, 5)
rep("Hello", 20)    
summary(mtcars)

x <- 1:100
x

mean(x)
sum(x)
median(x)
sd(x)
var(x)

help(mean) # Arithmetic Mean 

mean(x)
# mean is function name
# x inside the func. - we call "Arguments" 
# 1 func.can have No arg. , One arg., More Than one

yy <- c(1:10, NA, 20, 25)
yy
# NA : "Not Available" data - "Missing Value"
# if it has NA - we can't calculate, let try 
mean(yy)
# it shows the result as "NA" in console
# how to solve this? 
# we need to add one more Argument it is    na.rm
# na.rm : Not Available Remove - remove NA before cal
# let try ! - 2 argument in function
mean(yy, na.rm = TRUE)
# It's works now! 

# Some func. does't need any Argument!
# ex. getwd() - check working directory folder
getwd()


z <- 1:1000
z
fivenum(z)    
# fivenum() func. is Turkey Five-Number Summary
# to return: min,lower-hinge,median,higher-hinge,max
# lower-hinge:  1st quartile 
# higher-hinge: 3rd quartile 

#User-defined function
#To Create your own function

# function() {

# }

# (1) Basic function, NO Argument, to print Hello World 

my_first_function <- function() {
    print("Hello World")
    print("I'm here to learn R basics")
}

my_first_function()


# (2) Basic function, ONE Argument, ยกกำลังสอง (square)
square_function <- function(x) {
    print(x^2) 
}

square_function(5)
square_function(10)
square_function(-3)

# (3) Basic function, TWO Arguments, Addition 
addtwonums <- function(a,b) {
    return(a + b)
}

addtwonums(5,3)
addtwonums(5,100)
addtwonums(5,5000)

# We also set Default for arguments ex. put b = 100 
addtwonums_default <- function(a,b = 100) {
    return(a + b)
}
# put value only 1 argument for a
# it will shows result from a + 100 
addtwonums_default(2)

# however, we also overwrite the default 
addtwonums_default(a = 100, b = 50)

# we can also swap the place in R if we put the name
# R is awesome and smart Languages
addtwonums_default(b = 200, a = 33)

# (4) roll the dice function - random number (0-6)

roll <- function() {
    print(sample(1:6, 1))
}
roll()
roll()
roll()
roll()
roll()
roll()

help(sample)


# I practice write own functions. 
std_pop <- function(x) {
    n <- length(x)
    my_mean <- sum(x)/n 
    xx <- (x - my_mean)^2
    xx <- sum(xx)/n
    return (sqrt(xx))
}

std_pop(mtcars$hp)
sd(mtcars$hp)

# Another Way (1) 

std_pop1 <- function(x) {
    mean_x <- mean(x)             # find mean(x)
    n <- length(x)                # find N
    sum_x <- sum((x - mean_x)^2)  # sum squared deviation
    sqrt(sum_x /n)                # final computation
}

# Another Way (2) - Make it shorter !!!

std_pop2 <- function(x) {
    sqrt(sum((x - mean(x)) ^ 2) / length(x))
}

# Let's check !    
std_pop(mtcars$hp) == std_pop1(mtcars$hp) 
std_pop1(mtcars$hp) == std_pop2(mtcars$hp)   


age = c(12, 34, 56, 23, 17)
std_pop2(age) #standard deviation of population
sd(age)       #standard deviation of sample
# Sample will have value more than Pop


## create my own statistics summary function 
## by using List 

my_stats <- function(x) {
  mean_x <- mean(x)
  median_x <- median(x)
  min_x <- min(x)
  max_x <- max(x)
  sd_x <- sd(x)
  sum_x <- sum(x)
  
  return( list(
      average_x = mean_x,
      median_x = median_x,
      minimum_x = min_x,
      maximum_x = max_x,
      std_x = sd_x,
      sum_x = sum_x
  ))
}
# using "List" to keep all stat and return the Output. 
# And can change the name by using ' name =   ' 

my_stats(age)
my_stats(mtcars$hp)


# Filter NA 

x <- c(1,2,3,4,5,NA)
    # if the Vector has NA - the output will show NA     
my_stats(x)
    
    # How to check NA 
    # Using is.na() - the output will show T / F
    # NA - TRUE, Value = FALSE
is.na(x)

    # Change from NA from TRUE to FALSE 
    # Using    !is.na()
    # Now, NA = FALSE , Value = TRUE
!is.na(x)

    # Then, we will subset only TRUE (only Value)
    # Using [ ]
x[!is.na(x)]

    # put this line into our Function before cal stat. 
    # update new Value by assign <- into x
my_stats2 <- function(x) {
    x <- x[!is.na(x)]
    mean_x <- mean(x)
    sd_x <- sd(x)
    sum_x <- sum(x)
    
    return( list(
        average_x = mean_x,
        std_x = sd_x,
        sum_x = sum_x
    ))
}

x <- c(1,2,3,4,5,NA)
my_stats2(x)
