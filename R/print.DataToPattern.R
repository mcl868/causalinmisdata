print.DataToPattern<-function(x, digits=3, ...){
  object<-x
  rm(x)
  if(inherits(object,"DataToPattern")){
    
    
    cat("Missing pattern is monotone and the number of observations:\n")
    print(object$count)
    cat("Percents of observations:\n")
    print(object$percent)
    
    
    
  }
}