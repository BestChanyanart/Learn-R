# train control 
# Kfold Cross Validation 

ctrl <- trainControl(method = "cv", 
                     number = 5,
                     verboseIter = TRUE)

# **1.6 Train Model 
model_rfCV <- train(medv ~ crim + rm + age, 
                   data = train_data, 
                   method = "rf", 
                   trControl = ctrl)
model_rfCV

# 1.7 score model (prediction)
p6 <- predict(model_rfCV, newdata = test_data)


# 1.8 Evaluate Model -> RMSE 
error6 <- p6 - test_data$medv


rmse_test6 <- sqrt(mean(error6**2))
rmse_test6   


# -----------------------------

# train control 
# Kfold Cross Validation  # repeatedCV

ctrl_rp <- trainControl(method = "repeatedcv", 
                     number = 5,
                     repeats = 5, 
                     verboseIter = TRUE) # 5*5 = 25 times

# **1.6 Train Model 
model_rfCV_repeated <- train(medv ~ crim + rm + age, 
                    data = train_data, 
                    method = "rf", 
                    trControl = ctrl_rp)
model_rfCV_repeated

# 1.7 score model (prediction)
p7 <- predict(model_rfCV_repeated, newdata = test_data)


# 1.8 Evaluate Model -> RMSE 
error7 <- p7 - test_data$medv


rmse_test7 <- sqrt(mean(error7**2))
rmse_test7   

# --------------------------------

# train control 
# Kfold Cross Validation 
# KNN method with identify Length (random K)

ctrl <- trainControl(method = "cv", 
                     number = 5,
                     verboseIter = TRUE)

# **1.6 Train Model 
model_knnCV <- train(medv ~ crim + rm + age, 
                    data = train_data, 
                    method = "knn", 
                    tuneLength = 5, 
                    trControl = ctrl)
model_knnCV

# 1.7 score model (prediction)
p8 <- predict(model_knnCV, newdata = test_data)


# 1.8 Evaluate Model -> RMSE 
error8 <- p8 - test_data$medv


rmse_test8 <- sqrt(mean(error8**2))
rmse_test8   


# --------------------------------

# train control 
# Kfold Cross Validation 
# KNN method with identify K

ctrl <- trainControl(method = "cv", 
                     number = 5,
                     verboseIter = TRUE)

myGrid <- data.frame(k = c(3, 7, 11))
  
# **1.6 Train Model 
model_knnCV_grid <- train(medv ~ crim + rm + age, 
                     data = train_data, 
                     method = "knn", 
                     tuneGrid = myGrid, 
                     trControl = ctrl)
model_knnCV_grid

# 1.7 score model (prediction)
p9 <- predict(model_knnCV_grid, newdata = test_data)


# 1.8 Evaluate Model -> RMSE 
error9 <- p9 - test_data$medv


rmse_test9 <- sqrt(mean(error9**2))
rmse_test9   
