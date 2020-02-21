coef.ProbToData<-function(x, digits=3, ...){
  object<-x
  rm(x)
  if(inherits(object,"ProbToData")){
  return(round(object$CoefList,digits=digits))}}