seq.dr.mediator<-function(mmodels, exposure, int, covariates, regList, augList=NULL, data, ...){

out<-list()

  misdataobject<-do.call("missing.pattern",list(response = response.var(mmodels[[1]]),
                                                covariates = covariates,
                                                data = data))

  probdataobject<-do.call("prob.of.missing",list(object = misdataobject,
                                                 regList = regList))

  anadataobject<-do.call("seq.mediator.formula",list(mmodels = mmodels,
                                                     exposure = exposure,
                                                     int = int,
                                                     data = probdataobject$data))
 
  nb.effects<-anadataobject$nb.effects
  EXPOmatobj<-anadataobject$EXPOmat
  len.m.mod<-length(mmodels)
  len.expo<-length(exposure)
  len.cov<-length(covariates)
  len.EXPOmatobj<-length(EXPOmatobj)

  EXPOmat<-matrix(NA,ncol=len.expo,nrow=len.EXPOmatobj)
  for(j in 1:len.EXPOmatobj){EXPOmat[j,]<-EXPOmatobj[[j]][len.m.mod,]}
  rm("j")

  Estimates<-matrix(NA,ncol=1,nrow=len.EXPOmatobj)

    for(j in 1:len.EXPOmatobj){
      counter<-paste0("modelest",j)

      eval(parse(text=paste0("anadataobject$data$",counter,"<-anadataobject$",counter)))
      eval(parse(text=paste0("part1<-with(anadataobject$data,indicator(1*(C==Inf),",counter,"/varpi))")))

      confounderexposure<-anadataobject$data
      eval(parse(text=paste0("confounderexposure$",exposure,"<-",EXPOmat[j,])))
      eval(parse(text=paste0("confounderexposure$",exposure,"[is.na(anadataobject$data$",exposure,")]<-NA")))


  if(is.null(augList)){
    augList<-lapply(1:len.cov,function(i) paste0(covariates[1:i],collapse=" + "))
  }

  for(jj_ in 1:len.cov){
    augListobj<-as.formula(paste0(counter," ~ ",augList[[jj_]]))
    augV<-predict(glm(augListobj,data=anadataobject$data),type="response",newdata=confounderexposure)
    eval(parse(text=paste0("part",jj_+1,"<-with(anadataobject$data,indicator(1*(C>=",jj_,"),(1*(C==",jj_,")-lambda",jj_,"*(C>=",jj_,"))/K",jj_,"*augV))")))
  }
    eval(parse(text=paste0("Estimates[",j,",]<-mean(",paste0("part",c(1:(len.cov+1)),collapse="+"),")")))
}

  coef<-sapply(1:(nb.effects+1),function(i)Estimates[i+1,]-Estimates[i,])

  out$coef<-matrix(c(coef,sum(coef)),nrow=1)
  rownames(out$coef)<-"Est"
  colnames(out$coef)<-c("dir",if(nb.effects>0)paste0("indir_M",c(1:nb.effects)),"overall")

  out$mmodels<-mmodels
  out$N<-nrow(data)
  out$NCC<-nrow(na.omit(probdataobject$data))
  out$exposure<-exposure
  out$augList<-augList
  out$regList<-probdataobject$regList
  out$count<-probdataobject$count
  out$CoefList<-probdataobject$CoefList

  attr(out, "class")<-"seqdrmediator"
  return(out)}
