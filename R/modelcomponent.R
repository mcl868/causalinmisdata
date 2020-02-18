modelcomponent<-function(expo, ...){
  len.expo<-length(expo)

  c(1,unlist(
      sapply(1:(len.expo-1), function(i) combiexpo(combn(expo,i)))),
    paste0(combn(expo,len.expo),collapse="*"))}