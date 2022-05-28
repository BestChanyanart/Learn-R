library(tidyverse)

### JOIN table ###
     # inner join - join if both have same key 
     # left join   
     # full join 

     # semi join 
     # anti join

# create Sample Data Frame 

footballPlayers <- tribble(
    ~fullname, ~goals,
    "Vardy", 19,
    "Salah", 17,
    "Aubameyang", 17,
    "Ings", 16,
    "Aguero", 16,
    "Mane", 15,
    "Raul Jimenez", 15,
    "Martial", 14,
    "Rashford", 14,
    "Abraham", 13
)

footballTeams <- tribble(
    ~fullname, ~team,
    "Vardy", "Leicester",
    "Salah", "Liverpool",
    "Aubameyang", "Arsenal",
    "Aguero", "Man City",
    "Mane", "Liverpool",
    "Martial", "ManU",
    "Rashford", "ManU",
    "Abraham", "Chelsea",
    "Beckham", "ManU"
)

myFavPlayers <- tribble(
    ~fullname, ~team,
    "Vardy", "Leicester",
    "Ole", "ManU",
    "Cantona", "ManU",
    "Salah", "Liverpool",
    "Aguero", "Man City"
)


footballPlayers   # 10 players
footballTeams     # 9 players
myFavPlayers      # 5 players

# (1) Inner JOINS 
# both table has same key to match it. (overlap parts)

# e.g. table 1     table 2            result 
#     Vardy  19    Vardy Leicester    Vardy 19 Leicester
#     Ings                
#     Salah 17     Salah Liverpool    Sarah 17 Liverpool
#                  Beckham ManU        


# (2) Left JOIN 
# Put the table 1 first and then table 2 find to match it

# e.g. table 1     table 2            result 
#     Vardy  19    Vardy Leicester    Vardy 19 Leicester
#     Ings   16                       Ing   16 "NA"
#     Salah  17    Salah Liverpool    Sarah 17 Liverpool
#                  Beckham ManU        


# (3) full JOIN 
# Put the table 1 and table 2 

# e.g. table 1     table 2            result 
#     Vardy  19    Vardy Leicester    Vardy 19 Leicester
#     Ings   16                       Ing   16 "NA"
#     Salah  17    Salah Liverpool    Sarah 17 Liverpool
#                  Beckham ManU       Beckham "NA" ManU


inner_join(footballPlayers, 
           footballTeams,
           by = "fullname")    #key 

footballPlayers %>%
    inner_join(footballTeams, by = "fullname")
    
footballPlayers %>%
    left_join(footballTeams, by = "fullname")    

footballPlayers %>%
    full_join(footballTeams, by = "fullname")    


### filtering joins 
# to filter table 1 (by condition based on table 2)

# (4) semi JOIN 
# just compare 2 tables - To filter table 1 with table 2
# result- get only data from table1(that have in table2)

# e.g. table 1     table 2            result 
#     Vardy  19    Vardy Leicester    Vardy 19 
#     Ings                
#     Salah 17     Salah Liverpool    Sarah 17 
#                  Beckham ManU        

semi_join(footballPlayers, footballTeams,
          by = "fullname")

footballPlayers %>% 
    semi_join(footballTeams, by = "fullname")


# (5) anti JOIN
# just compare 2 tables - To filter table 1 with table 2
# result: get only data from table1 (that not in table2)

# e.g. table 1     table 2            result 
#     Vardy  19    Vardy Leicester    
#     Ings  16                        Ings 16
#     Salah 17     Salah Liverpool    
#                  Beckham ManU        

anti_join(footballPlayers, footballTeams, 
          by = "fullname")

footballPlayers %>% 
    anti_join(footballTeams, by = "fullname")


# Another Example 
# Table 1: FootballPlayers 
# Table 2: MyFavPlayers

# They are Top10 scorer and my favorite player
semi_join(footballPlayers, myFavPlayers, 
          by = "fullname")
        
# They are Top10 scorer but they are not my fav player 
anti_join(footballPlayers, myFavPlayers, 
          by = "fullname")


# Function union(), intersect(), setdiff()

# To get only 1 column "fullname" in both data set 
footballPlayers_name <- footballPlayers %>% 
    select(fullname)

myFavPlayers_name <- myFavPlayers %>% 
    select(fullname)

### union() - combine both data set 
# combine list of all players (top score and my fav)
union(footballPlayers_name, myFavPlayers_name)


### intersect()  - overlap 
# top scorers who are my favorite
intersect(footballPlayers_name, myFavPlayers_name)

         
### setdiff()
# top scorers who are NOT my favorite
setdiff(footballPlayers_name, myFavPlayers_name)


