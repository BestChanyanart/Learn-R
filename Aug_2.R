library(tidyverse)
library(viridis)
library(RColorBrewer)

country <- c("Germany", "Egypt", "Malaysia",
             "France", "USA" )
year_1995 <- c(10, 9, 20, 30, 70)
year_2000 <- c(10, 12, 30, 60,80)
year_2005 <- c(15, 17, 35,70, 90)
year_2010 <- c(20, 22, 50, 90, 90)

tourist_arrivals <- tibble(
    country <- c("Germany", "Egypt", "Malaysia",
                 "France", "USA" ),
    year_1995 <- c(10, 9, 20, 30, 70),
    year_2000 <- c(10, 12, 30, 60,80),
    year_2005 <- c(15, 17, 35,70, 90),
    year_2010 <- c(20, 22, 50, 90, 90))

colnames(tourist_arrivals) <- 
    c("country", "1995", "2000", "2005", "2010")

p1 <- tourist_arrivals %>% 
    pivot_longer(`1995`:`2010`, 
                 names_to = "year",
                 values_to = "value")

ggplot(data = p1,
       aes(year, value, 
           color=country, 
           group=country)) +
    geom_line(size=0.8, alpha = 0.6) + 
    geom_point() +
    theme_classic() +
    labs(title = "International Tourist Arrivals (millions)") + 
    scale_y_continuous(
    breaks = c(0,10,20,30,40,50,60,70,80,90,100), limits = c(0,100))


telephone_call <- tibble(
    call_type <- c("1. Local-landline", 
           "2. National&International landline",
                   "3. Mobiles"),
    year1995 <- c(12000, 6000, 200),
    year1996 <- c(13000, 6500, 1000),
    year1997 <- c(13500, 6800, 1900),
    year1998 <- c(15000, 7000, 2200),
    year1999 <- c(16000, 8000, 2400),
    year2000 <- c(16800, 8200, 3000),
    year2001 <- c(17000, 9000, 5500),
    year2002 <- c(16400, 9800, 7300),
    year2003 <- c(13800, 10200,8200),
    year2004 <- c(12000, 10400,9800))

colnames(telephone_call) <- 
    c("type", "1995", "1996","1997","1998","1999","2000", "2001", "2002","2003", "2004")

p2 <- telephone_call %>% 
    pivot_longer(`1995`:`2004`,
                 names_to = "year",
                 values_to = "minutes")

ggplot(data = p2,
       aes(year, minutes, 
           fill=type, 
           group=type)) +
    geom_col(position = "dodge") + 
    theme_minimal() +
    scale_fill_manual(values = c("navy", "steelblue","light blue")) +
    labs(title = "Sweden's telephone calls by Category from 1995 to 2004", x = "Year", y  = "minutes(millions)") + 
    scale_y_continuous(breaks = c(0,2000,4000,6000,8000,10000,12000,14000,16000,18000),limits = c(0,18000))



