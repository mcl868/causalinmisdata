seq.mediator<-function(mmodels, exposure, int, data, ...){

  len.e.mod<-length(exposure)

  outpoints<-do.call("seq.mediator.formula", list(mmodels, exposure, int, data, complete=TRUE))

  out<-list()

  coef<-matrix(0,nrow=2+outpoints$nb.effects,ncol=1)
  coef[1,]<-with(outpoints,dirEst)
  if(outpoints$nb.effects>0){
    for(ll in 1:outpoints$nb.effects)coef[ll+1,]<-eval(parse(text=paste0("outpoints$indirEst_M",ll)))}
  coef[outpoints$nb.effects+2,]<-sum(coef)


  colnames(coef)<-"Est"
  rownames(coef)<-c("dir",
                    if(outpoints$nb.effects>0)paste0("indir_M",c(1:outpoints$nb.effects)),
                    "overall")


  out$mmodels<-mmodels
  out$coef<-t(coef)
  out$exposure<-exposure 
  out$N<-nrow(data)
  out$NCC<-nrow(outpoints$data)

  attr(out, "class")<-"seqmediator"
  return(out)}

