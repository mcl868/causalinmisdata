coef.seqmediator<-function(x, digits=3, ...){
  object<-x
  rm(x)
  if(inherits(object,"seqmediator")){
  return(round(object$CoefList,digits=digits))}}