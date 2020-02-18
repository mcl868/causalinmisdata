g.dicho<-function(mmodels, exposure, data, ...){

  len.e.mod<-length(exposure)

  EXPOmat<-permutations(2,len.e.mod,c(0,1),repeats=TRUE)
  combivector<-c();for(i in 1:nrow(EXPOmat))combivector[i]<-paste0(EXPOmat[i,],collapse="")

  outpoints<-do.call("g.dicho.formula", list(mmodels, exposure, data, complete=TRUE))

  rm(list=c("combivector","EXPOmat"))
  out<-list()

  coef<-parametercausal(exposure,outpoints$estimate)
  
  out$coef<-coef
  out$mmodels<-mmodels
  out$exposure<-exposure 
  out$N<-nrow(data)
  out$NCC<-nrow(outpoints$data)

  attr(out, "class")<-"gcompdicho"
  return(out)}