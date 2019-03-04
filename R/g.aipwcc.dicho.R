g.aipwcc.dicho<-function(mmodels, pmodels, covariates, pattern, regList, data, aug = NULL, ...){

out<-list()
  misdataobject<-do.call("missing.pattern",list(response = response.var(mmodels[[1]]),
                                                covariates = covariates,
                                                data = data,
                                                pattern = pattern))

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

if(pattern == "Monotone"){
  for(j in 1:(2^len.expo)){
    counter<-paste0(response.var(mmodels[[1]]),"_",paste0(EXPOmat[j,],collapse=""))
    eval(parse(text=paste0("anadataobject$data$",counter,"<-anadataobject$",counter)))
    eval(parse(text=paste0("part1<-with(anadataobject$data,indicator(1*(C==Inf),",counter,"/varpi))")))

    confounderexposure<-anadataobject$data
    eval(parse(text=paste0("confounderexposure$",exposure,"<-",EXPOmat[j,])))

    if(is.null(aug))augList<-vector("list",len.cov)
    for(jj_ in 1:len.cov){
      if(is.null(aug)){
      augList[[jj_]]<-as.formula(paste0(counter," ~ ",paste0(covariates[1:jj_],collapse=" + ")))
      aug<-predict(glm(augList[[jj_]],data=anadataobject$data),type="response",newdata=confounderexposure)
    }
    eval(parse(text=paste0("part",jj_+1,"<-with(anadataobject$data,indicator(1*(C>=",jj_,"),(1*(C==",jj_,")-lambda",
                           jj_,"*(C>=",jj_,"))/K",jj_,"*aug))")))
    aug<-NULL
    }
    rm("confounderexposure")

    eval(parse(text=paste0("out$E",counter,"_mis<-mean(",paste0("part",c(1:(len.cov+1)),collapse="+"),")")))
  }
} else {
  for(j in 1:(2^len.expo)){
    counter<-paste0(response.var(mmodels[[1]]),"_",paste0(EXPOmat[j,],collapse=""))
    eval(parse(text=paste0("anadataobject$data$",counter,"<-anadataobject$",counter)))
    eval(parse(text=paste0("part1<-with(anadataobject$data,indicator(1*(C==Inf),",counter,"/varpi))")))

    confounderexposure<-anadataobject$data
    eval(parse(text=paste0("confounderexposure$",exposure,"<-",EXPOmat[j,])))
aug<-predict(glm(as.formula(paste0(counter," ~ ",paste0(attr(terms(model1),"term.labels"),collapse=" + "))),data=anadataobject$data),type="response",newdata=confounderexposure)

    eval(parse(text=paste0("part2<-with(anadataobject$data,(1*(C==Inf)-varpi)/varpi*aug)")))


  eval(parse(text=paste0("out$E",counter,"_mis<-mean(part1-part2)")))

}


}
  return(out)}