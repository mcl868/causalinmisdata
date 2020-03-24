combiexpo<-function(expo, ...){
  sapply(1:ncol(expo), function(i)paste0(expo[,i],collapse="*"))}
