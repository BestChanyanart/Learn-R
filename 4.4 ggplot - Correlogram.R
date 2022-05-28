## Correlation Plot (Correlogram) 
library(corrplot)

## 1. check column 
# Only numeric can do correlation 
# so, we need to delete factor column from mtcars
glimpse(mtcars)
mtcars_numeric <- mtcars %>% 
    select(-vs,-am)

## 2. create correlation matrix 
cor_matrix <- cor(mtcars_numeric)
cor_matrix

## 3. create the plot 
corrplot(cor_matrix)
# if r = 1 (blue), r = -1(red), r = 0(white) 

## 4. To flip the chart  
# because correlogram are symmetry 
corrplot(cor_matrix, type="upper")
corrplot(cor_matrix, type="lower")

# can agjust the method from circle(default) to color
corrplot(cor_matrix, 
         method = "color",
         type="upper")

# 5. can put argument co-efficient r into the graph
corrplot(cor_matrix, 
         method = "color",
         type="upper",
         addCoef.col = "black", number.cex = 0.3)

# 6. can order the color of graph 
# order = "hclust"

corrplot(cor_matrix, 
         method = "color",
         type="upper",
         addCoef.col = "black", number.cex = 0.3, 
         order = "hclust")
