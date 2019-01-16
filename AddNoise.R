hist <- runif(1000,min = 1,max=20)


eta <- rep(NA,length(hist))
for (i in 1:length(hist)){
  
  if(i==1 || i==2 || i==length(hist) || i==(length(hist)-1)){
    eta[i] <- hist[i]
  }else{
    eta[i] <- hist[i] - (hist[i-2]+hist[i-1]+hist[i+1] + hist[i+2])/4
  }
  
}
c <- sqrt(mean(eta^2))
c
# x_t
x_t <- runif(10000,min = 2,max=15)
y_t <- mean(x_t) + (x_t - mean(x_t))*sqrt((var(x_t)+2*c^2)/var(x_t))

################################################
noiseAdd <- function(history,sim_witoutNoise){
  eta <- rep(NA,length(history))
  
  for (i in 1:length(history)){
    
    if(i==1 || i==2 || i==length(history) || i==(length(history)-1)){
      eta[i] <- history[i]
    }else{
      eta[i] <- history[i] - (history[i-2]+history[i-1]+history[i+1] + history[i+2])/4
    }
    
  }
  
  c <- sqrt(mean(eta^2))
  sim_withNoise <- mean(sim_witoutNoise) + (sim_witoutNoise - mean(sim_witoutNoise))*sqrt((var(sim_witoutNoise)+2*c^2)/var(sim_witoutNoise))
  return (sim_withNoise)       
}

