print.ProbToData<-function(x, digits=3, ...){
  object<-x
  rm(x)
  if(inherits(object,"ProbToData")){
  
  cat("Missing pattern is",tolower(object$pattern),"and the coeffiecnts are of the regression are:\n")
  if(object$pattern=="Monotone"){for(jj in 1:length(object$CoefList)){print(round(object$CoefList[[jj]],digits))}}
  if(object$pattern=="TwoLevel"){print(round(object$CoefList,digits))}

  cat("Data:\n")
  print(round(head(object),digits)) 
    
  }
}