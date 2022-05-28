##### DATA TYPES #####

# Basic Operation 

# Comment 
1 + 1
4 - 2
5 ^ 3  # Exponent / Power (เลขยกกำลัง)
5 ** 3 # Exponent / Power (เลขยกกำลัง)
4 %% 2 # Modulo (Mod) return 0 
4 %% 3 #              return 1

# It also has "Math Function" inside R 
sqrt(25) 
log(100) 
exp(4.6)


# My FORMULA
2 * 100 - 5

# PRINT FUNCTION 
print("Hello World")

# Create OBJECT
# R language is "Object-Oriented Programming"

x <- 1
y <- 2 
x + y

# remove object 
rm(y)

# Data Type: The smallest data 
#    1. numeric  1, 3, 5
#    2. character   
#    3. logical
#    4. factor
#    5. date

# check Data Type
class(x)
class(TRUE)

age <- 25
class(age)
is.numeric(age)
# check data type: answer will be TRUE / FALSE

# Mathematics symbol 
1 == 1      #equal 
2 != 2      #not equal 
pi          #PI
# > , <     #more than less than 

# 2. Characters 
name = "Chanyanart K"
class(name)
is.character(name)

# 3. Logical 
"Hello" == "hello"       #FALSE, case sensitive
5 > 2
5 >= 10 
10 != 5 
answer <- 10 <= 100 
class(answer)
is.logical(answer)

# 4. Factor - Categorical Data (จับกลุ่ม แบ่งกลุ่มข้อมูล)

# 4.1 factor NOMINAL
animal <- c("cat", "dog", "dog", "hippo")
print(animal); class(animal) 
                #data type - character 

#How to change to factor
factor(animal)
animal <- factor(animal)  #Update value in animal
class(animal)


# 4.2 factor ORDINAL (order/ranking)
temperature <- c("hot", "cold", "cold", "medium", "cold", "hot")

temperature <- factor(temperature, 
                      label = c("cold", "medium", "hot"),
                      ordered = TRUE)
temperature
class(temperature)  # "ordered" "factor" 



# 5. Date 
# yyyy--mm--dd   hh:mm:ss   tz

Sys.time()      #check the date and time

x <- "2020-06-26" # now it is character
x <- as.Date(x)   # convert to Date (data type) as.Date()
class(x)

# covert Data Types
x <- 100; class(x)
x <- as.character(x)
class(x)
print(x)

y1 <- as.numeric(TRUE)         # TRUE = 1
y2 <- as.numeric(FALSE)        # FALSE = 0
y1 ; y2