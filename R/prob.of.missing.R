prob.of.missing<-function(object, regression, list.out = TRUE, completecase = FALSE, regList, order=NULL, ...){

  if(inherits(object,"DataToPattern")){
  
  objdata<-object$data
  covariatesObj<-object$covariatesObj
  responseObj<-object$responseObj	

  
################
# Pattern
  levels<-as.numeric(rownames(table(objdata$C))[!rownames(table(objdata$C)) %in% Inf])
  qq<-c(1:length(covariatesObj))
  eval(parse(text=paste0("objdata$lambda",qq[!(qq %in% levels)],"<-0")))
  CoefList<-vector("list",length(covariatesObj))
  if(!missing(regList)){
  	for(iii_ in levels){
  	lambdamodel<-paste0("1*(C==",iii_,") ~ ",regList[[iii_]])
    CoefList[[iii_]]<-coef(glm(lambdamodel, data= objdata[objdata$C>=iii_,],family=binomial()))
 	  lambda<-predict(glm(lambdamodel, data= objdata[objdata$C>=iii_,],family=binomial()),type="response", newdata=objdata)
  	eval(parse(text=paste0("objdata$lambda",iii_,"<-lambda")))
  	}
  } else {
  	if(missing(regression)){message("regression is simple")}
    regList<-vector("list",length(covariatesObj))
   	if(is.null(order))order<-covariatesObj
  	for(iii_ in levels){
  	  lambdamodel<-paste0("1*(C==",iii_,") ~ ",paste0(order[1:iii_],collapse=" + "))
      regList[[iii_]]<-lambdamodel
      CoefList[[iii_]]<-coef(glm(lambdamodel, data= objdata[objdata$C>=iii_,],family=binomial()))
      lambda<-predict(glm(lambdamodel, data= objdata[objdata$C>=iii_,],family=binomial()),type="response", newdata=objdata)
      eval(parse(text=paste0("objdata$lambda",iii_,"<-lambda")))
    }}
  objdatalambda<-objdata[,paste0("lambda",qq)]
  objdatalambda[is.na(objdata[,covariatesObj])]<-NA
  eval(parse(text=paste0("objdata$lambda",qq,"<-NULL")))
  objdata<-cbind(objdata,objdatalambda)
  objdata$K0<-1
  for(iiii_ in qq){eval(parse(text=paste0("objdata$K",iiii_,"<-objdata$K",iiii_-1,"*(1-objdata$lambda",iiii_,")")))}
  objdata$K0<-NULL
  eval(parse(text=paste0("objdata$varpi<-objdata$K",length(regList))))
    
# Pattern
################
  if(list.out){
    out<-list()
      if(completecase){
      objdata<-objdata[objdata$C==Inf,]
      message("Complete Case")
      out$completecase
    }
    out$regList<-regList
    out$CoefList<-CoefList
    out$count<-addmargins(table(objdata$C))
    out$percent<-table(objdata$C)/nrow(objdata)
    out$data<-objdata

    attr(out, "class")<-"ProbToData"
    output<-structure(out, class = "ProbToData")
  } else {
  	if(completecase){
      objdata<-objdata[objdata$C==Inf,]
      message("Complete Case")
    }
    output<-objdata
  }
  

  return(output)
  }
}
