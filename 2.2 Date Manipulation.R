# Date Manipulation 
# yyyy-mm-dd  hh:mm:ss   (from ISO)

#Function that working with Date 
library(lubridate)


x <- "2020-06-26"
class(x)

# Let's convert Characters to Date by Function ymd
ymd("2020-06-26")
class(ymd("2020-06-26"))

# If it start from date-month-year, it also change by dmy
dmy("31-12-2025")
            # it will change to "2025-12-31" (ymd)

# If it start from month-date-year, it also change by mdy
mdy("06-30-1988")
            # it will change to "1988-06-30" (ymd)

# R is very Flexible, No matter what dates look like. 
mdy("JUNE-30-1988")  # letter 
mdy("JUN-30-1988")   # abbreviate 3 letter
mdy("JUN/30/1988")   # using /

# Let's do date and time ! + change class "DATE"
ymd_hms("2020 June 26 20:57:30")
        # result: "2020-06-26 20:57:30 UTC"
        # UTC is time zone


# If we want to convert Time Zone, 
# we will use Arg. (tz = "continent/city")
ymd_hms("2020 June 26 20:57:30", 
        tz = "Asia/Bangkok" )
        
        # result: "2020-06-26 20:57:30 +07"
        # Bangkok is +07 from UTC


# Put date in Variable
mydate <- ymd_hms("2020 June 26 20:57:30", 
                  tz = "Asia/Bangkok" ) 
class(mydate)
        # result: "POSIXct" "POSIXt" == Date

# If we want to Extract from mydate 
year(mydate)                # 2020

month(mydate)               # 6
month(mydate, label = TRUE) # JUN
month(mydate, label = TRUE, abbr = FALSE) # June
                            
day(mydate)                 # 26
wday(mydate, label = TRUE)  # Fri
wday(mydate, label = TRUE, abbr = FALSE)  # Friday
                            
# We also check this week of year. 
# Normally "1 year" has "52 weeks".
week(mydate)
                    # we are at week 26, half year now!
                    # More 26 weeks to GO !!!

## Function R vectorized (applying in all data in vector)
mymy_dates <- c("2020-06-25", 
                  "2019-12-31",
                  "2020-01-20")


mymy_dates <- ymd(mymy_dates)  #change class to Date class
year(mymy_dates)               # 2020 2019 2020
month(mymy_dates, label=T)     # Jun Dec Jan
wday(mymy_dates, label=T)      # Thu Tue Mon



                    
