seq.mediator.formula<-function(mmodels, exposure, int, data, complete = FALSE, ...){

  len.m.mod<-length(mmodels)
  len.expo<-length(exposure)

  for(i in 1:(len.m.mod-1)){eval(parse(text=paste0("mmodels[[i+1]]<-update(mmodels[[i+1]], model",i," ~ .)")))}
  rm("i")

  if(complete){data<-na.omit(data)}

  out<-list()
  out$data<-data
  out$mmodels<-mmodels
  out$exposure<-exposure 

  exposcombitemp<-matrix(0,nrow=(len.m.mod+1),ncol=len.m.mod)
  exposcombitemp[(len.m.mod+1),]<-1
  for(i in 2:len.m.mod)exposcombitemp[i,]<-c(1,rep(0,i-1),rep(1,len.m.mod-i))
    exposcombitemp[,sapply(1:len.m.mod,function(i) eval(parse(text=paste0("(!int %in% covariate.var(mmodels[[",i,"]]))"))))]<-0
  exposcombi<-t(exposcombitemp[order(rowSums(exposcombitemp)),])
  colnames(exposcombi)<-rep(int,(len.m.mod+1))


  EXPOmat<-lapply(1:(len.m.mod+1),function(i)
                  matrix(0,nrow=len.m.mod,ncol=len.expo,dimnames = list(rep("",len.m.mod),exposure)))
  for(i in 1:(len.m.mod+1))EXPOmat[[i]][,exposure %in% int]<-exposcombi[,i]

  while(any(duplicated(EXPOmat))){
    for(ll_ in c(1:length(EXPOmat))[duplicated(EXPOmat)])EXPOmat[[ll_]]<-NULL}

  

  for(ii_ in 1:length(EXPOmat)){
    for(iii_ in 1:len.m.mod){
      confounderexposure<-data
      eval(parse(text=paste0("confounderexposure$",exposure,"<-",EXPOmat[[ii_]][iii_,])))
        eval(parse(text=paste0("data$model",iii_,"<-mvalues")))}
      rm("confounderexposure")

    eval(parse(text=paste0("out$modelest",ii_ ,"<-data$model",len.m.mod)))

    eval(parse(text=paste0("modelest",ii_ ,"<-mean(data$model",len.m.mod,")")))}

  for(i in 1:(length(EXPOmat)-1)){
    eval(parse(text=paste0("out$",ifelse(i==1,"dirEst",paste0("indirEst_M",i-1)),"<-modelest",i+1,"-modelest",i)))}


  out$nb.effects<-(length(EXPOmat)-2)
  out$exposure<-exposure
  out$EXPOmat<-EXPOmat

  attr(out, "class")<-"seqmediatorformula"
  return(out)}