# Correlation 
    ### pearson - for numeral 
    ### spearman- for ordinal
    ### kendall - non-parametric

mtcars
cor(mtcars$hp, mtcars$mpg) 
    # r = -0.7761684

cor(mtcars$wt, mtcars$mpg) 
    # r = -0.8676594

plot(mtcars$hp, mtcars$mpg, pch=16) 
plot(mtcars$wt, mtcars$mpg, pch=16) 
plot(mtcars$wt, mtcars$hp, pch=16) 
   # pch=16 : change to black dot

## correlation Metric 

cor(mtcars[ , c("mpg", "wt", "hp")] )
    # get all rows, and get 3 variables

## dplyr (tidyverse) 
library(dplyr) 

mtcars %>% 
    select(mpg, wt, hp) %>% 
    cor() 

## check Sig? (p-value)
cor.test(mtcars$hp, mtcars$mpg) 

# ----------------------------------
# Linear Regression 

## mpg = f(hp)
lmFit <- lm(mpg ~ hp, data = mtcars)
         # get Intercept and Slope

##  get linear Regression table
summary(lmFit)

## Let's do " Prediction "

    # get some stat inside lm 
    # (only Intercept and Slope)
lmFit$coefficients

    # mpg = Intercept + Slope*hp
lmFit$coefficients[[1]] + lmFit$coefficients[[2]]*200

## predict new data 
    
    # create new cars 
new_cars <- data.frame(
    hp = c(250, 320, 400, 410, 450)
)

    # predict() - use model to predict new dataset
predict(lmFit, newdata = new_cars)

    # put them to the new column 
new_cars$mpg_predict <- predict(lmFit, newdata = new_cars)

new_cars

# -----------------------------

## multiple Linear Regression 
    ## mpg = f(hp, wt, am) 
    ## mpg = intercept + b0*hp + b1*wt + b2*am

lmFit_v2 <- lm(mpg ~ hp + wt + am, data = mtcars)

lmFit_v2

## let's predict 
## if hp=200, wt=3.5, am=1 

    # get only coef first 
coefs <- coef(lmFit_v2)

coefs[[1]] + coefs[[2]]*200 + coefs[[3]]*3.5 + coefs[[4]]*1
    # predicted_mpg = 18.51583

# -------------------------------
# RMSE (Root Mean Squared Error)

## Build Full Model - use all variable to predict mpg 

lmFit_Full <- lm(mpg ~ . , data=mtcars)



    # 1. get predicted_mpg (y^)
mtcars$predicted <- predict(lmFit_Full)

head(mtcars)

    # 2. get error 
squared_error <- (mtcars$mpg - mtcars$predicted) ** 2

    ## 3. RMSE 
rmse <- sqrt(mean(squared_error))
    ## RMSE = 2.146905

#-------------------------------

# Golden Rule (Train gr. & Test gr.)
## 1. Split Data  

sample(1:10, 3) #get 3 data, random from 1-10

    # 1.1 get n 
n <- nrow(mtcars)
n 

    # 1.2 sample (Train - 80%)
set.seed(29) 
id <- sample(1:n, size= n*0.8)
train_data <- mtcars[id, ]
test_data <- mtcars[-id, ] # -id: delete what id we use (get only 20%)

## 2. Train Model 

model1 <- lm(mpg ~ hp + wt, data = train_data)

pred_train <- predict(model1)
squarErr_train <- ((train_data$mpg - pred_train) ** 2) 
rmse_train <- sqrt(mean(squarErr_train))   

## 3. Test Model 
pred_test <- predict(model1, newdata = test_data)
error_test <- test_data$mpg - pred_test 
rmse_test <- sqrt(mean(error_test **2 ))

## print Result 
cat("RMSE Train: ", rmse_train,
    "\nRMSE Test: ", rmse_test)

