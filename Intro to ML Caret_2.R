# caret template for building ml model 

library(caret)

# Linear Regression (lm)
# **1.6 Train Model 
model_lm <- train(medv ~ crim + rm + age, 
                  data = train_data, 
                  method = "lm")
model_lm

# 1.7 score model (prediction)
p2 <- predict(model_lm, newdata = test_data)
p2

# 1.8 Evaluate Model -> RMSE 
error2 <- p2 - test_data$medv
error2

rmse_test2 <- sqrt(mean(error2**2))
rmse_test2   

model_lm$finalModel


# ---------------------------------- 

# KNN (K-Nearest)
# **1.6 Train Model 
model_knn <- train(medv ~ crim + rm + age, 
                  data = train_data, 
                  method = "knn")
model_knn

# 1.7 score model (prediction)
p3 <- predict(model_knn, newdata = test_data)
p3

# 1.8 Evaluate Model -> RMSE 
error3 <- p3 - test_data$medv
error3

rmse_test3 <- sqrt(mean(error3**2))
rmse_test3   

# ---------------------------------- 

# rpart/CART  (Recursive Partitioning) 
# Classification /Decision Tree 

# **1.6 Train Model 
model_rpart <- train(medv ~ crim + rm + age, 
                   data = train_data, 
                   method = "rpart")
model_rpart

# 1.7 score model (prediction)
p4 <- predict(model_rpart, newdata = test_data)
p4

# 1.8 Evaluate Model -> RMSE 
error4 <- p4 - test_data$medv
error4

rmse_test4 <- sqrt(mean(error4**2))
rmse_test4


# ---------------------------------- 

# rf  (Random Forest) 
install.packages("randomForest")
library(randomForest)

# **1.6 Train Model 
model_rf <- train(medv ~ crim + rm + age, 
                     data = train_data, 
                     method = "rf")
model_rf

# 1.7 score model (prediction)
p5 <- predict(model_rf, newdata = test_data)
p5

# 1.8 Evaluate Model -> RMSE 
error5 <- p5 - test_data$medv
error5

rmse_test5 <- sqrt(mean(error5**2))
rmse_test5
