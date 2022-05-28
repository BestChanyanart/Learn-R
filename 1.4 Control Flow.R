
##### CONTROL FLOW #####
    # 1. if else 
    # 2. For loop 
    # 3. while loop 
#It help control structure in R Language. 

# (1) If Statement 

# e.g. If we want to check Number 5 is Odd or Even Number
#      with If-else statement. 

5 %% 2
    # answer is 1 >> Numerator is 1 (so, 5 is Odd Number)

4 %% 2
    # answer is 0 >> Numerator is 0 (so, 4 is Even Number)

# Symbol %% (Modulo, mod) for calculate to get Numerator.
                            # Numerator (ตัวเศษ)
                         # Denominator (ตัวส่วน)

10 %% 3 
    # answer is 1 ( Numerator is 1)

100 %% 6 
    # answer is 4 ( Numerator is 4)

4 %% 3 
    # answer is 1 ( Numerator is 1)

# Let's check Odd and Even Number!!! 

x <- 5 

if (x %% 2 == 0) {
    print("Even Number")
} else {
    print("Odd Number")
}
                # The answer is Odd Number

# Let's define the function !!!

odd_or_even <- function(x) {
    if (x %% 2 == 0) {
        print("Even Number")
    } else {
        print("Odd Number")
    }
}

odd_or_even(10)
odd_or_even(9)

# function "ifelse" 

a <- c(1,3,5,2,5,6)
ifelse(a %% 2 == 0, "Even", "Odd")

    # ifelse ( condition, if true do this, else )
    # the result is 
    # "Odd"  "Odd"  "Odd"  "Even" "Odd"  "Even"


b <- c(1:10)
ifelse(b %% 2 != 0, "Odd", "Even")
    #   !=    is not equal  



# (2) For Loop 
# For Loop is iteration
# Hadley Wickham said "For Loop" is not efficient in R

y <- 1:10                     # (y = 1 - 10)

for (i in y) {
    print(i)
}

    # i is a dummy (can change to any letters) e.g. a, b

for (a in y) {
    print("Hello World")
}

# Let's combine For Loop and If else condition. 

for (i in y) {
    if (i %% 2 == 0) {
        print("Even Number")
    } else {
        print("Odd Number")
    }
}

# Hadley Wickham said "For Loop" is not efficient in R
# There are many lines. It has to write many {}. 

# Actually, we can use  "ifelse" instead of "For loop"

ifelse(y %% 2 == 0, "Even", "Odd")
    # the answer are the same but we write only 1 line.


# (3) While Loop 

# before start while loop
# let's start with function paste()

paste()
    # can combine 2 chars. and stick together. 
a <- "Hello"
b <- "World"

paste(a,b, "This is my R course.")
        # result: "Hello World This is my R course."

# Let's start While Loop 
        # define c = 0 (starting point) 
        # It's very important!, initialize starting point
c <- 0  
while (c <= 10) {
    print(c)
    c <- c+1      # Important line! - it called counter 
}

d <- 0
while (d <= 10) {
    print(paste(d, "less than or equal to ten."))
    d <- d+1      # Update d value
}

###### Summary Control Flow ##### 

score <- 95
if (score >= 50) {
    print("Passed") 
} else {
    print("Failed")
}


for (i in 1:10) {
    print("Hello World")
}


x <- 10                 # starting point is 10
while (x >= 0) {
    print(x)
    x = x - 1           # Update x value by subtraction
}


######### Easy Way ######## by using function 

    # 1. if_else() 
    # 2. case_when() 

# (1) if_else() - create new column using condition
mtcars %>% 
  select(hp) %>%
  mutate(group = if_else(hp > 100, "high HP", "low HP"))
            
              # if_else( condition, if TRUE, if FALSE )

# (2) case_when - many conditions
mtcars %>% 
    select(hp) %>% 
    mutate(group = case_when(
        hp <= 100 ~ "low HP",
        hp <= 200 ~ "medium HP",
        TRUE ~ "high HP"
    ))

                # TRUE means otherwise above condition 
                # More than 200 HP - "High HP"

# Assign to new objects 
hp_groups <- mtcars %>% 
    select(hp) %>% 
    mutate(group = case_when(
        hp <= 100 ~ "low HP",
        hp <= 200 ~ "medium HP",
        TRUE ~ "high HP"
    ))
hp_groups
