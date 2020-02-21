coef.gcompdicho<-function(x, digits=3, ...){
  object<-x
  rm(x)
  if(inherits(object,"gcompdicho")){
  return(round(object$CoefList,digits=digits))}}