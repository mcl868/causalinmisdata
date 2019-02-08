g.aipw.dicho.formula<-function(mmodels, pmodels, data, complete = FALSE, ...){

  len.m.mod<-length(mmodels)
  len.p.mod<-length(pmodels)
  exposure<-c()
  for(ii in 1:len.p.mod)exposure[ii]<-response.var(pmodels[[ii]])
  len.expo<-length(exposure)

  if(complete){data<-na.omit(data)}

  out<-list()
  out$data<-data

  data$pi0<-1

  for(ii_ in 1:length(pmodels)){
    pvalues<-predict(glm(pmodels[[ii_]], data = data,family = binomial()),type="response",newdata=data)
    eval(parse(text=paste0("data$pi",ii_,"<-pvalues")))
    expo<-eval(parse(text=paste0("response.var(pi",ii_,")")))
    eval(parse(text=paste0("data$pi",ii_,"<-ifelse(data$",expo,"==0,1-data$pi",ii_,",data$pi",ii_,")")))
  }

  EXPOmat<-permutations(2,len.expo,c(0,1),repeats=TRUE)

  for(j in 1:(2^len.expo)){
    confounderexposure<-data
    eval(parse(text=paste0("confounderexposure$",exposure,"<-",EXPOmat[j,])))
    for(ii_ in 1:length(mmodels)){
      mvalues<-predict(glm(mmodels[[ii_]], data = data),type="response",newdata=confounderexposure)
      eval(parse(text=paste0("data$model",ii_,"<-mvalues")))
    }
    rm("confounderexposure")

    eval(parse(text=paste0("data$part1<-with(data,(",response.var(mmodels[[1]]),"*",
                           paste0("(",exposure,"==",EXPOmat[j,],")",collapse="*"),")/(",
                           paste0("pi",c(1:len.p.mod),collapse="*"),"))")))

    model<-paste0("model",length(mmodels):1)
    for(ii_ in 1:length(mmodels)){
      eval(parse(text=paste0("data$part",ii_+1,"<-with(data,",
                             paste0(ifelse(ii_==1,"","("),exposure[c(1:ii_)-1],ifelse(ii_==1,1,"=="),EXPOmat[j,c(1:ii_)-1],
                                    ifelse(ii_==1,"",")"),collapse="*"),
                             "/(",paste0("pi",c(1:ii_)-1,collapse="*"),
                             ")*(1-(",exposure[ii_],"==",EXPOmat[j,ii_],")/pi",ii_,")*",model[ii_],")")))
    }
  
  eval(parse(text=paste0("out$",response.var(mmodels[[1]]),"_",paste(EXPOmat[j,],collapse=""),"<-with(data,(",
                         paste0("part",c(1:(len.m.mod+1)),collapse="+"),"))")))
  }
  out$exposure<-exposure

  attr(out, "class")<-"aipwgcompdichoformula"
  return(out)}
