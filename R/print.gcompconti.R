print.gcompconti<-function(x, digits=3, ...){
  object<-x
  rm(x)
  if(inherits(object,"gcompconti")){

    cat("m/mu-models:\n")
    for(iii_ in 1:length(object$mmodels)){print(object$mmodels[[iii_]])}
    cat("\n")

    elements<-c("N","NCC","exposure","mmodels","pmodels")

    Eobjects<-paste0("object$",names(object)[!names(object) %in% elements])
    Est<-matrix(round(sapply(1:length(Eobjects),function(i)eval(parse(text=Eobjects[i]))),digits),ncol=1)
    rownames(Est)<-paste("  ",names(object)[!names(object) %in% elements])
    colnames(Est)<-"Est"
    cat("\n")
    print(Est)
    cat("\n")
    if(object$N>object$NCC){
      cat("Used",object$NCC,"observations to estimation and",object$N-object$NCC,"records have been deleted.\n")
    }else{
      cat("Used",object$NCC,"observations to estimation.\n")}
    
  }
}

