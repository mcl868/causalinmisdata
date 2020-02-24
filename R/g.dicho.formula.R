g.dicho.formula<-function(mmodels, exposure, data, complete = FALSE, ...){

  len.m.mod<-length(mmodels)
  len.expo<-length(exposure)

  for(i in 1:(len.m.mod-1)){eval(parse(text=paste0("mmodels[[i+1]]<-update(mmodels[[i+1]], model",i," ~ .)")))}
  rm("i")

  if(complete){data<-na.omit(data)}

  out<-list()
  out$data<-data

  estimate<-matrix(NA,nrow=(2^len.expo),ncol=1)
  estname<-c()
  EXPOmat<-permutations(2,len.expo,c(0,1),repeats=TRUE)
  for(j in 1:(2^len.expo)){
    confounderexposure<-data
    eval(parse(text=paste0("confounderexposure$",exposure,"<-",EXPOmat[j,])))
    eval(parse(text=paste0("confounderexposure$",exposure,"[is.na(data$",exposure,")]<-NA")))
    for(ii_ in 1:len.m.mod){
      mvalues<-predict(glm(mmodels[[ii_]], data = data),type="response",newdata=confounderexposure)
      eval(parse(text=paste0("data$model",ii_,"<-mvalues")))
    }
    rm(list=c("confounderexposure","ii_"))

  eval(parse(text=paste0("out$Y_",paste0(EXPOmat[j,],collapse=""),"<-mvalues")))

  estimate[j,]<-mean(eval(parse(text=paste0("data$model",length(mmodels)))))
  estname[j]<-paste0("EY",paste0(EXPOmat[j,],collapse=""))
  }
  rm("j")

  rownames(estimate)<-estname
  out$estimate<-estimate

  out$exposure<-exposure

  attr(out, "class")<-"gcompdichoformula"
  return(out)}
