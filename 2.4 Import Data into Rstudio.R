library(tidyverse)
## Load Data set ##
        # 1. Excel (sheet 1, sheet 2)
        # 2. csv. 
        # 3. text file     (3.1) with delimiter ;
        #                  (3.2) with spacing by tab    


## 1. Load Excel files into R
library(readxl)

getwd()
list.files()
list.files(path="Data")  # path - folder name in wd


#read_excel("path/file name", sheet = " ")
read_excel("Data/student1.xlsx", sheet = "Sheet1")
read_excel("Data/student1.xlsx", sheet = "Sheet2")

s1 <- read_excel("Data/student1.xlsx", sheet = "Sheet1")



## 2. CSV file = Comma Separated Values
read_csv("Data/student2a.csv")

s2 <- read_csv("Data/student2a.csv")

# files csv. sometimes has comment in the files. 
# look at file (student2a) 
# the first 2 rows are not data. 
# How to get data by skipping first 2 row? - start row 3
read_csv("Data/student2b.csv", skip = 2)

# we can preview data by using ( n_max ) to preview 3 row
read_csv("Data/student2b.csv", skip = 2, n_max = 3)



## 3. Text file using delimiter 

# split each columns by ; (delimiter)
read_delim("Data/student3.txt", delim = ";")
s3 <- read_delim("Data/student3.txt", delim = ";")


# split each columns by tab (spacing) \t
read_delim("Data/student4.txt", delim = "\t")
s4 <- read_delim("Data/student4.txt", delim = "\t")


### Let's combine 4 tibble ###
# 1. Put them into the list 
all_student <- list(s1, s2, s3, s4)
all_student

# 2. Use function bind_rows to combine list
bind_rows(all_student)
all_student <- bind_rows(all_student)
all_student



######## WRITE CSV FILE - Export file from Rstudio

all_student
write_csv(all_student, "Data/all_student.csv")

# write_csv( object, "create file name") - save in WD
# write_csv( object, "sub folder/create file name")
