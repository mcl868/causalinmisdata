modelcomponent<-function(expo, ...){
  len.expo<-length(expo)

  if(len.expo>1)
    c(1,unlist(
        sapply(1:(len.expo-1), function(i) combiexpo(combn(expo,i)))),
      paste0(combn(expo,len.expo),collapse="*")) else c(1,expo)}
