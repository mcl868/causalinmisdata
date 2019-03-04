g.comp.conti<-function(mmodels, exposure, data, ...){

  outpoints<-do.call("g.comp.conti.formula", list(mmodels, exposure, data, complete=TRUE))
  namesOfPoints<-names(outpoints)[!names(outpoints) %in% c("data","exposure")]
  out<-vector("list",length(namesOfPoints))

  names(out)<-paste0("E",namesOfPoints)
  for( ii_ in 1:length(namesOfPoints)){
  eval(parse(text=paste0("out$E",namesOfPoints[ii_],"<-mean(outpoints$",namesOfPoints[ii_],")")))
  }

  out$mmodels<-mmodels
  out$N<-nrow(data)
  out$NCC<-nrow(outpoints$data)
  out$exposure<-outpoints$exposure

  attr(out, "class")<-"gcompconti"
  return(out)}