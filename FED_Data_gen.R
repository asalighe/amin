# dt1 : CCAR 2018 : comes from get_macro()
# dt2 : FED 
dt1 <- data.table(Forecast_Period = seq(-5,5),
                  x=rnorm(11),
                  y=rnorm(11),
                  z=rnorm(11),
                  w=rnorm(11))

dt2 <- data.table(Forecast_Period = seq(-5,5),
                  x=rnorm(11),
                  y=rnorm(11))
tmp <- copy(dt1)                 

dt1[Forecast_Period > 0,
    (setdiff(names(dt1),names(dt2))) := NA]



dt2 <- merge(dt2,dt1[,c("Forecast_Period",setdiff(names(dt1),names(dt2))),with=F],
             by="Forecast_Period",all.x = T)
dt2

m1 <- lm(z ~ y , data = dt1[Forecast_Period<=0 ])
summary(m1)
dt2[Forecast_Period >0, z := predict(m1,newdata = dt2[Forecast_Period >0])]
dt2
dt2[Forecast_Period >0 , w := x  + tmp[Forecast_Period >0, .(mean(w-x))][[1]]]
dt2








