g.aipw.dicho<-function(mmodels, pmodels, data, ...){

  len.p.mod<-length(pmodels)

  EXPOmat<-permutations(2,len.p.mod,c(0,1),repeats=TRUE)
  combivector<-c();for(i in 1:nrow(EXPOmat))combivector[i]<-paste0(EXPOmat[i,],collapse="")

  outpoints<-do.call("g.aipw.dicho.formula", list(mmodels, pmodels, data, complete=TRUE))
  namesOfPoints<-names(outpoints)[!names(outpoints) %in% c("data","exposure",paste0("Upsilon_",combivector),
                                                                             paste0("m_",combivector),
                                                                             paste0(paste0("weight",response.var(mmodels[[1]]),"_"),combivector))]
  rm(list=c("combivector","EXPOmat"))
  out<-list()

  ExpectEstimate<-matrix(NA,ncol=1,nrow=length(namesOfPoints))
  
  for( ii_ in 1:length(namesOfPoints)){
  ExpectEstimate[ii_,]<-eval(parse(text=paste0("mean(outpoints$",namesOfPoints[ii_],")")))}
  rownames(ExpectEstimate)<-paste0("E",namesOfPoints)
  colnames(ExpectEstimate)<-"Estimate"

  coef<-parametercausal(outpoints$exposure,ExpectEstimate)

  out$coef<-coef
  out$ExpectEstimate<-ExpectEstimate
  out$mmodels<-mmodels
  out$pmodels<-pmodels
  out$N<-nrow(data)
  out$NCC<-nrow(outpoints$data)
  out$exposure<-outpoints$exposure

  attr(out, "class")<-"aipwgcompdicho"
  return(out)}