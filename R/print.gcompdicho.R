print.gcompdicho<-function(x, digits=3, ...){
  object<-x
  rm(x)
  if(inherits(object,"gcompdicho")){

    cat("m/mu-models:\n")
    for(iii_ in 1:length(object$mmodels)){print(round(object$mmodels[[iii_]],digits=digits))}
    cat("\n")
    cat("exposures:\n")
    for(iii_ in 1:length(object$exposure)){print(round(object$exposure[[iii_]],digits=digits))}

    elements<-c("N","NCC","exposure","mmodels")

    cat("\n")
    print(round(object$coef,digits=digits))
    cat("\n")
    if(object$N>object$NCC){
      cat("Used",object$NCC,"observations to estimation and",with(object,N-NCC),"records have been deleted.\n")
    }else{
      cat("Used",object$NCC,"observations to estimation.\n")}
    
  }
}