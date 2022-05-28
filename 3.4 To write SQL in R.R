install.packages("sqldf")
library(sqldf)

mtcars
sqldf("SELECT mpg, hp, wt 
      FROM mtcars
      LIMIT 5;")

sqldf("SELECT * FROM mtcars
      WHERE hp <= 80;")

sqldf("SELECT * FROM mtcars
      WHERE hp <= 80 AND am = 0;")

sqldf("SELECT AVG(hp), SUM(hp)
      FROM mtcars;")

# same as R languages: 
mtcars %>% 
    summarise(avg_hp = mean(hp),
              sum_hp = sum(hp))

mtcars %>% 
    group_by(am) %>%
    summarise(avg_hp = mean(hp),
              sum_hp = sum(hp))

sqldf("SELECT am,
        AVG(hp), SUM(hp)
        FROM mtcars
        GROUP BY am;")



