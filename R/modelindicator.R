modelindicator<-function(expo, ...){
  modelcomponentexpo<-modelcomponent(expo)

  len.modelcomponentexpo<-length(modelcomponentexpo)
  modelindicatormatrix<-matrix(sapply(1:len.modelcomponentexpo, function(i)eval(parse(text=modelcomponentexpo[i]))),nrow=1)
  colnames(modelindicatormatrix)<-modelcomponent(names(expo))

return(modelindicatormatrix)}