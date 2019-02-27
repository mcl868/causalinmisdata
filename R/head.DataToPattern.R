head.DataToPattern<-function(x, ...){
  object<-x
  rm(x)
  if(inherits(object,"DataToPattern")){
  head(object$data)
  }}