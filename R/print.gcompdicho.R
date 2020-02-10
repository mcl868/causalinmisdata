print.gcompdicho<-function(x, digits=3, ...){
  object<-x
  rm(x)
  if(inherits(object,"gcompdicho")){

    cat("m/mu-models:\n")
    for(iii_ in 1:length(object$mmodels)){print(object$mmodels[[iii_]])}
    cat("\n")
    cat("exposures:\n")
    for(iii_ in 1:length(object$exposure)){print(object$exposure[[iii_]])}

    elements<-c("N","NCC","exposure","mmodels")

    cat("\n")
    print(object$coef)
    cat("\n")
    if(object$N>object$NCC){
      cat("Used",object$NCC,"observations to estimation and",with(object,N-NCC),"records have been deleted.\n")
    }else{
      cat("Used",object$NCC,"observations to estimation.\n")}
    
  }
}