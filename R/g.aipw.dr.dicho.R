g.aipw.dr.dicho<-function(mmodels, pmodels, covariates, regList, augList=NULL, data, ...){

out<-list()
  misdataobject<-do.call("missing.pattern",list(response = response.var(mmodels[[1]]),
                                                covariates = covariates,
                                                data = data))

  probdataobject<-do.call("prob.of.missing",list(object = misdataobject,
                                                 regList = regList))

  anadataobject<-do.call("g.aipw.dicho.formula",list(mmodels = mmodels,
                                                     pmodels = pmodels,
                                                     data = probdataobject$data))

  exposure<-anadataobject$exposure
  len.m.mod<-length(mmodels)
  len.p.mod<-length(pmodels)
  len.expo<-length(exposure)
  len.cov<-length(covariates)

  EXPOmat<-permutations(2,len.expo,c(0,1),repeats=TRUE)

  ExpectEstimate<-matrix(NA,ncol=1,nrow=(2^len.expo))
    listofnames<-c()

    for(j in 1:(2^len.expo)){
      counter<-paste0(response.var(mmodels[[1]]),"_",paste0(EXPOmat[j,],collapse=""))
      listofnames[j]<-paste0("E",counter)

      eval(parse(text=paste0("anadataobject$data$",counter,"<-anadataobject$",counter)))
      eval(parse(text=paste0("part1<-with(anadataobject$data,indicator(1*(C==Inf),",counter,"/varpi))")))

      confounderexposure<-anadataobject$data
      eval(parse(text=paste0("confounderexposure$",exposure,"<-",EXPOmat[j,])))

  if(is.null(augList)){
    augList<-lapply(1:len.cov,function(i) paste0(covariates[1:i],collapse=" + "))
  }

  for(jj_ in 1:len.cov){
    augListobj<-as.formula(paste0(counter," ~ ",augList[[jj_]]))
    augV<-predict(glm(augListobj,data=anadataobject$data),type="response",newdata=confounderexposure)
    eval(parse(text=paste0("part",jj_+1,"<-with(anadataobject$data,indicator(1*(C>=",jj_,"),(1*(C==",jj_,")-lambda",jj_,"*(C>=",jj_,"))/K",jj_,"*augV))")))
  }
    eval(parse(text=paste0("ExpectEstimate[",j,",]<-mean(",paste0("part",c(1:(len.cov+1)),collapse="+"),")")))
}
  colnames(ExpectEstimate)<-"Estimate"
  rownames(ExpectEstimate)<-listofnames

  out$ExpectEstimate<-ExpectEstimate

  coef<-parametercausal(outpoints$exposure,ExpectEstimate)

  out$coef<-coef
  out$mmodels<-mmodels
  out$pmodels<-pmodels
  out$N<-nrow(data)
  out$NCC<-nrow(na.omit(probdataobject$data))
  out$exposure<-exposure
  out$augList<-augList

  attr(out, "class")<-"aipwdrgcompdicho"
  return(out)}