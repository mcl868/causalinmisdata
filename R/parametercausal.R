parametercausal<-function(expo, estoutcom, ...){
  len.expo<-length(expo)

  mcexpo<-modelcomponent(expo)
  mcexpo[mcexpo %in% "1"]<-"(Intercept)"

  EXPOmat<-permutations(2,len.expo,c(0,1),repeats=TRUE)
  colnames(EXPOmat)<-expo

  solvepara<-matrix(0,ncol=2**len.expo,nrow=2**len.expo)
  for(i in 1:2**len.expo){
  solvepara[i,]<-modelindicator(expo=EXPOmat[i,])}

  param<-solve(solvepara)%*%estoutcom
  rownames(param)<-mcexpo
  colnames(param)<-"Est."
  return(t(param))}