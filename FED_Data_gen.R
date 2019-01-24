# dt1 : CCAR 2018 : comes from get_macro()
# dt2 : FED 
dt1 <- data.table(Forecast_Period = seq(-5,5),
                  x=rnorm(11),
                  y=rnorm(11),
                  z=rnorm(11),
                  w=rnorm(11))
dt1
dt2 <- data.table(Forecast_Period = seq(-5,5),
                  x=rnorm(11),
                  y=rnorm(11))
tmp <- dt2                  

dt1[Forecast_Period > 0,
    setdiff(names(dt1),names(dt2)) := NA]

dt1

dt2 <- merge(dt2,dt1[,c("Forecast_Period",setdiff(names(dt1),names(dt2))),with=F],
             by="Forecast_Period",all.x = T)
dt2
