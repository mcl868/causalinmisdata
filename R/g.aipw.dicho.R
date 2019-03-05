g.aipw.dicho<-function(mmodels, pmodels, data, ...){

  len.p.mod<-length(pmodels)

  EXPOmat<-permutations(2,len.p.mod,c(0,1),repeats=TRUE)
  combivector<-c();for(i in 1:nrow(EXPOmat))combivector[i]<-paste0(EXPOmat[i,],collapse="")

  outpoints<-do.call("g.aipw.dicho.formula", list(mmodels, pmodels, data, complete=TRUE))
  namesOfPoints<-names(outpoints)[!names(outpoints) %in% c("data","exposure",paste0("Upsilon_",combivector),
                                                                             paste0("m_",combivector),
                                                                             paste0("weightY_",combivector)]
  rm(list=c("combivector","EXPOmat"))
  out<-list()

  coef<-matrix(NA,ncol=1,nrow=length(namesOfPoints))
  
  for( ii_ in 1:length(namesOfPoints)){
  coef[ii_,]<-eval(parse(text=paste0("mean(outpoints$",namesOfPoints[ii_],")")))}
  rownames(coef)<-paste0("E",namesOfPoints)
  colnames(coef)<-"Estimate"

  out$coef<-coef
  out$mmodels<-mmodels
  out$pmodels<-pmodels
  out$N<-nrow(data)
  out$NCC<-nrow(outpoints$data)
  out$exposure<-outpoints$exposure

  attr(out, "class")<-"aipwgcompdicho"
  return(out)}