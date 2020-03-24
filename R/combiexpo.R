combiexpo<-function(expo, ...){
  expo<-matrix(expo)
  sapply(1:ncol(expo), function(i)paste0(expo[,i],collapse="*"))}
