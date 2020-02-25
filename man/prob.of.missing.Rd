\name{prob.of.missing}
\alias{prob.of.missing}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimate the probabilities for stopping observering additional vaiables
}
\description{

}
\usage{
prob.of.missing(object, regression, list.out = TRUE, completecase = FALSE, regList, order = NULL, ...) 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
%%     ~~Describe \code{x} here~~
}
  \item{regression}{
%%     ~~Describe \code{x} here~~
}
  \item{list.out}{
%%     ~~Describe \code{x} here~~
}
  \item{completecase}{
%%     ~~Describe \code{x} here~~
}
  \item{regList}{
%%     ~~Describe \code{x} here~~
}
  \item{order}{
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
}
\author{
Thomas Maltesen
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
See \code{\link{missing.pattern}}.
}
\examples{
\dontrun{
regList<-list()
regList[[1]]<-"L0"
regList[[2]]<-"L0 + A0"
regList[[3]]<-"L0 + A0 + L1"
regList[[4]]<-"L0 + A0 + L1 + A1"
regList[[5]]<-"L0 + A0 + L1 + A1 + L2"
regList[[6]]<-"L0 + A0 + L1 + A1 + L2 + A2 + A1*A2"

DataSetCount<-Coef1List<-Coef2List<-Coef3List<-Coef4List<-Coef5List<-Coef6List<-list()
for(iiii in 1:loop){
  misdata<-missing.pattern(response = "Y",
                           covariates = c("L0","A0","L1","A1","L2","A2"),
                           data = DataSetMonotone[[iiii]])
  DataSetCount[[iiii]]<-misdata$count

  DataSetobj<-prob.of.missing(misdata, regList = regList)

  Coef1List[[iiii]]<-DataSetobj$CoefList[[1]]
  Coef2List[[iiii]]<-DataSetobj$CoefList[[2]]
  Coef3List[[iiii]]<-DataSetobj$CoefList[[3]]
  Coef4List[[iiii]]<-DataSetobj$CoefList[[4]]
  Coef5List[[iiii]]<-DataSetobj$CoefList[[5]]
  Coef6List[[iiii]]<-DataSetobj$CoefList[[6]]}

listMean(DataSetCount)

      1       2       3       4       5       6     Inf     Sum 
 218.21  213.16  178.90  125.52  252.93  153.14  858.14 2000.00 

round(listMean(Coef1List),3)
(Intercept)          L0
     -3.181      -1.887
round(listMean(Coef2List),3)
(Intercept)          L0          A0
     -3.556      -1.716       1.940
round(listMean(Coef3List),3)
(Intercept)          L0          A0          L1
     -3.130      -1.915       1.918       1.518
round(listMean(Coef4List),3)
(Intercept)          L0          A0          L1          A1
     -3.766      -1.630       1.978       1.536       1.513
round(listMean(Coef5List),3)
(Intercept)          L0          A0          L1          A1          L2
     -3.871      -1.652       1.916       1.528       1.536      -1.023
round(listMean(Coef6List),3)
(Intercept)          L0          A0          L1          A1          L2          A2       A1:A2
     -4.191      -1.631       1.946       1.533       1.601      -1.040       1.350       1.068
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
