g.aipw.dicho<-function(mmodels, pmodels, data, ...){

  outpoints<-do.call("g.aipw.dicho.formula", list(mmodels, pmodels, data, complete=TRUE))
  namesOfPoints<-names(outpoints)[!names(outpoints) %in% c("data","exposure")]
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