install.packages("caret", "tidyverse", "e1071", "mlbench")
                 
library(tidyverse)
library(caret)
library(mlbench)

# 1. K-Nearest Neighbors  ( KNN )
## Euclidean Distance 
## to find distance for every data points 
## and choose 5 nearest points (Odd Number)
### Classification -> Majority vote
### Regression -> average 

# 1.1 load dataset 
data("BostonHousing")
View(BostonHousing)
  # y = medv (median value price)
  # x = crim (crime rate), rm (rooms in house), tax 

?BostonHousing   # dataset document 

# 1.2 tibble == enhanced dataframe
boston <- as_tibble(BostonHousing)
  
# 1.3 Preview data / explore data 
head(boston)
tail(boston)

# 1.4 Check Missing Values 
mean(complete.cases(boston)) == 1    # 1 = 1  (no NA) 

# 1.5 Split Data 
set.seed(29) 
n <- nrow(boston)
id <- sample(1:n, size = n*0.8) 
train_data <- boston[id, ]
test_data <- boston[-id, ]

# 1.6 train Model 
lmModel <- lm(medv ~ crim + rm + age, 
              data = train_data)

lmModel

# 1.7 score model (prediction)
p <- predict(lmModel, newdata = test_data)
p

# 1.8 Evaluate Model -> RMSE 
error <- p - test_data$medv
error

rmse_test <- sqrt(mean(error**2))
rmse_test   





