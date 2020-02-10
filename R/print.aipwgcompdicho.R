print.aipwgcompdicho<-function(x, digits=3, ...){
  object<-x
  rm(x)
  if(inherits(object,"aipwgcompdicho")){

    cat("m/mu-models:\n")
    for(iii_ in 1:length(object$mmodels)){print(object$mmodels[[iii_]])}
    cat("\n")
    cat("pi-models:\n")
    for(iii_ in 1:length(object$pmodels)){print(object$pmodels[[iii_]])}

    elements<-c("N","NCC","exposure","mmodels","pmodels")

    cat("\n")
    print(object$coef)
    cat("\n")
    if(object$N>object$NCC){
      cat("Used",object$NCC,"observations to estimation and",with(object,N-NCC),"records have been deleted.\n")
    }else{
      cat("Used",object$NCC,"observations to estimation.\n")}
    
  }
}