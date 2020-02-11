missing.pattern<-function(response, covariates, data, ...){
  result<-list()
  
  variables<-c(covariates, response)
  lengthVar<-length(variables)
  
  dataPre<-data[, variables]
  dataPre$C<-rowSums(1*!is.na(dataPre))
  dataPre$C[dataPre$C==lengthVar]<-Inf
  data1<-dataPre[!dataPre$C==0,]

  data2<-data1[rowSums((1*is.na(data1[1:(lengthVar-1)]))<=(1*is.na(data1[2:lengthVar])))==(lengthVar-1),]
  
  result$data<-data2
  result$covariatesObj<-covariates
  result$responseObj<-response
  result$count<-addmargins(table(data2$C))
  result$percent<-table(data2$C)/nrow(data2)

  attr(result, "class")<-"DataToPattern"
  out<-structure(result, class = "DataToPattern")
  
  return(out)}
