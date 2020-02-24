print.TransformMonotone<-function(x, digits=3, ...){
  object<-x
  rm(x)
  if(inherits(object,"TransformMonotone")){
    
  if(nrow(object$data)==nrow(object$datasetredu)){
    cat("Missing pattern is monotone and the number of observations:\n")
    print(object$tableC)
    cat("Percents of observations:\n")
    print(object$tableCpercent)
    } else {
    cat("Missing pattern is monotone and the number of observations:\n")
    print(object$tableCredu)
    cat("Percents of observations:\n")
    print(object$tableCpercentredu)
    }
    cat("\n")
    if(!object$transformnb==0){
      cat("There are",length(object$transformnb),"records transformed to follow a monotone pattern.\n")
    } else {
      cat("There is no record transformed to follow a monotone pattern.\n")
    }
    cat("The threshold is:",object$threshold,"percent.\n")
  }
}