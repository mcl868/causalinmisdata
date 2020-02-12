head.TransformMonotone<-function(x, ...){
  object<-x
  rm(x)
  if(inherits(object,"TransformMonotone")){
  head(object$data)
  }}