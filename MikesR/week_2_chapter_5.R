library(nycflights13)
library(tidyverse)

#5.2.4 filter

  #1,#2
  arrival_delay_2_hours=filter(flights,arr_delay>=2*60)
  destination_houston=filter(flights,dest %in% c('IAH','HOU'))
  airlines_ua_aa_dl=filter(flights,carrier %in% c('AA','UA','DL'))
  departed_summer=filter(flights,month %in% c('7','8','9'))
  depart_on_time_arrival_delay_2_hours=filter(flights,arr_delay>=2*60 & dep_delay <=0)
  depart_late_made_up_30_mins=filter(flights,arr_delay-dep_delay<-30 & dep_delay >=60)
  departed_between_midnight_and_6am=filter(flights,between(dep_time,0,600))
  
  #3 flights that didn't leave
  dep_time_missing=filter(flights,is.na(dep_time))
  
  #4 When is doesn't matter what NA is the answer is given
  
  #helpful things
  
  #found this helpful to get all the distinct values
  levels(factor(flights$month))
  #view is useful to explore the data

#5.3.1 arrange
  #1
  arrange(flights,desc(is.na(dep_time)))
  #2 don't understand what the question wants
  arrange(flights,desc(arr_delay))
  #3
  arrange(flights,desc(distance/air_time))
  
#5.4.1
  select(flights,c('dep_time','dep_delay'))
  select(flights,c('dep_time','dep_time'))
  #3 on of works if column names don't exist
  vars <- c("year", "month", "day", "dep_dlay", "arr_delay")
  a=select(flights,one_of(vars))
  b=select(flights,vars)
  #4
  select(flights, contains("TIME",ignore.case = FALSE))
  
#5.5.2
  #1
  convert_time_to_minutes=function(time){
    time%%100+time%/%100*60
  }
  
  flights_with_mins=mutate(a,dep_time_mins = convert_time_to_minutes(dep_time))
  
  #2 convert time and need to include the date or assume it's  one day berfore
  #not sure what air_time is for as it's not the difference between arr and depart
  #really best to try and convert things to proper date time units here and use a library
  View(
      transmute(
        flights, 
        df=convert_time_to_minutes(arr_time)-convert_time_to_minutes(dep_time),
        at=convert_time_to_minutes(arr_time),
        dt=convert_time_to_minutes(dep_time),
        arr_time,dep_time,air_time
      )
    )
  
  
