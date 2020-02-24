print.seqdrmediator<-function(x, digits=3, ...){
  object<-x
  rm(x)
  if(inherits(object,"seqdrmediator")){

    cat("m/mu-models:\n")
    for(iii_ in 1:length(object$mmodels)){print(object$mmodels[[iii_]])}
    cat("\n")
    cat("exposures:\n")
    for(iii_ in 1:length(object$exposure)){print(object$exposure[[iii_]])}

    elements<-c("N","NCC","exposure","mmodels")

    cat("\n")
    print(round(object$coef,digits=digits))

    cat("\n")
 
    cat("Missing pattern is monotone and the number of observations:\n")
    print(object$count)
    
  }
}
