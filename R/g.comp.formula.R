g.comp.conti.formula<-function(mmodels, exposure, data, complete = FALSE, ...){

if(all(exposure %in% names(data))){

  len.m.mod<-length(mmodels)

  if(complete){data<-na.omit(data)}

  out<-list()
  out$data<-data

  

  EXPOmat<-permutations(2,len.expo,c(0,1),repeats=TRUE)

  for(j in 1:(2^len.expo)){
    confounderexposure<-data
    eval(parse(text=paste0("confounderexposure$",exposure,"<-",EXPOmat[j,])))
    for(ii_ in 1:length(mmodels)){
      mvalues<-predict(glm(mmodels[[ii_]], data = data),type="response",newdata=confounderexposure)
      eval(parse(text=paste0("data$model",ii_,"<-mvalues")))
  }
  rm("confounderexposure")

  model<-paste0("model",1:len.m.mod)
  eval(parse(text=paste0("data$mu<-data$",model[len.m.mod])))

  eval(parse(text=paste0("out$",response.var(mmodels[[1]]),"_",paste(EXPOmat[j,],collapse=""),"<-with(data,mu)")))
  }
  out$exposure<-exposure

  attr(out, "class")<-"gcompcontiformula"
  return(out)
  } else {
warning(paste0("Your exposuse(s) do not belong to data ",paste(exposure,collapse=", "),"."))
}}