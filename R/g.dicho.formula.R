g.dicho.formula<-function(mmodels, exposure, data, complete = FALSE, ...){

  len.m.mod<-length(mmodels)
  len.expo<-length(exposure)

  if(complete){data<-na.omit(data)}

  out<-list()
  out$data<-data

  estimate<-matrix(NA,nrow=(2^len.expo),ncol=1)
  estname<-c()
  EXPOmat<-permutations(2,len.expo,c(0,1),repeats=TRUE)
  for(j in 1:(2^len.expo)){
    confounderexposure<-data
    eval(parse(text=paste0("confounderexposure$",exposure,"<-",EXPOmat[j,])))
    for(ii_ in 1:length(mmodels)){
      mvalues<-predict(glm(mmodels[[ii_]], data = data),type="response",newdata=confounderexposure)
      eval(parse(text=paste0("data$model",ii_,"<-mvalues")))
    }
    rm("confounderexposure")

  estimate[j,]<-mean(eval(parse(text=paste0("data$model",length(mmodels)))))
  estname[j]<-paste0("EY",paste0(EXPOmat[j,],collapse=""))
  }
  rownames(estimate)<-estname
  out$estimate<-estimate

  out$exposure<-exposure

  attr(out, "class")<-"gcompdichoformula"
  return(out)}
