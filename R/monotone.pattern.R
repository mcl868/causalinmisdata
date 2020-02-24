monotone.pattern<-function(measurements, data, id=NULL, transform=TRUE, threshold=0.05, ...){

  out<-list()

  datasetOrg<-data

  if(!is.null(id)){rownames(data)<-data[,colnames(data)[colnames(data) %in% id]]}

  dataset<-data[,measurements]
  nb<-nrow(dataset)

  aaaa<-lapply(1:(length(measurements)-1),function(i)
               c(1:nb)[!1*is.na(dataset[,measurements[i]])<=1*is.na(dataset[,measurements[i+1]])])

  dataset$transform<-"NO"
  for(jj in 1:(length(measurements)-1)){
  jjinte<-c((jj+1):length(measurements))
  dataset[aaaa[[jj]],measurements[jjinte]]<-NA
  dataset$transform[aaaa[[jj]]]<-"YES"
}

  if(!is.null(id)){eval(parse(text=paste0("dataset$",id,"<-rownames(dataset)")))
                   rownames(dataset)<-NULL}
  
  if(transform){dataset$C<-rowSums(!is.na(dataset[,measurements,]))
                tablematrix<-as.matrix((table(dataset$C)/nb)>threshold)
                datasetredu<-dataset[(dataset$C %in% row(tablematrix)[tablematrix,]),]
                dataset$C[dataset$C==length(measurements)]<-Inf
                datasetredu$C[datasetredu$C==length(measurements)]<-Inf}

  if(transform){
    out$data<-dataset
    out$transformnb<-if("YES" %in% dataset$transform){c(1:nb)[dataset$transform=="YES"]} else {0}
    out$tableC<-c(table(dataset$C),sum(table(dataset$C)))
    out$tableCpercent<-(out$tableC/nb)
    out$transform<-transform
    out$threshold<-threshold
    out$datasetredu<-datasetredu
    out$tableCredu<-c(table(datasetredu$C),sum(table(datasetredu$C)))
    out$tableCpercentredu<-(out$tableCredu/nrow(datasetredu))
  } else {
    out$data<-datasetOrg
    out$nonmonotone<-c(1:nb)[dataset$transform=="YES"]
  }

    attr(out, "class")<-"TransformMonotone"
    output<-structure(out, class = "TransformMonotone")

return(out)}




