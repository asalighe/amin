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



Add_Shock(df,10,10,var=c('x1','x2'))

plot(df$x1,type="l")