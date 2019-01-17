df <- data.table(t=seq(1,50),
                 x1=rnorm(50),
                 x2=rnorm(50))
keep <- df
plot(df$x1,type="l")

Add_Shock <- function(data,mag, time,var){
  t_shock <- seq(0,nrow(data),by=time)
  for (i in 1:length(var)){
    data[t%in%t_shock, var[i] := get(var[i]) + sd(get(var[i]))*mag]
  }
}

Add_Shock2 <- function(data,mag, time,var){
  t_shock <- seq(0,nrow(data),by=time)
  for (v in var){
    data[t%in%t_shock, paste(v) := get(v) + sd(get(v))*mag]
  }
}

Add_Shock2(df,10,10,var=c('x1','x2'))

plot(df$x1,type="l")
###
library(data.table)
library(dplyr)
library(lubridate)
df <- data.table(date=seq(as.Date("2018-01-01"),by="month",length.out = 12),
                 Income=sample(1:100,12),
                 Revenue=sample(1:100,12))
df
noChange_var <- c("date")
for (v_ in names(df)){
  if(!v_ %in% noChange_var){
    df[,paste(v_,"l1",sep="_"):= get(v_) - shift(get(v_))]
  }
  
}
df
df2 <- df %>% 
  group_by(quarter(date))%>%
  summarise_all(funs(mean))
df2
mean(df$Income[1:3])


varList <- names(df)
varList
sub("_l1","",varList)
df$date
df$date-month(1)
df$date-quarter(1)
str(df)

