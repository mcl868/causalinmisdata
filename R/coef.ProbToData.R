coef.ProbToData<-function(x,...){
  object<-x
  rm(x)
  if(inherits(object,"ProbToData")){
  return(object$CoefList)
  }}