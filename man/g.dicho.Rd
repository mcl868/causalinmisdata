\name{g.dicho}
\alias{g.dicho}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The estimator for the g-formula that utilizes data only complete cases
}
\description{

}
\usage{
g.dicho(mmodels, exposure, data, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mmodels}{
The models correspond to the models the outcome.
}
  \item{exposure}{
The time-varying exposure.
}
  \item{data}{
Data.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{coef}{
The coefficients in marginal strucktural model.
}
\item{ExpectEstimate}{
The expected value of the potential outcome.
}
\item{mmodels}{
The mmodels that have been used for modeling data.
}
\item{exposure}{
The exposure of the analysis.
}
\item{N}{
The sample size of data.
}
\item{NCC}{
The sample size of complete cases of data. In case of no missing values NCC is equal to N
}
\item{...}{

}
}
\references{
put references to the literature/web site here
}
\author{
Thomas Maltesen
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
\dontrun{
model1 <- Y ~ L0 + A0 + L1 + A1 + L2 + A2 + L2*A2
model2 <- L2 ~ A1 + L1 + A0 + L0
model3 <- L1 ~ A0 + L0 + A0*L0


estimationSG<-lapply(1:loop,function(iiii) g.dicho(mmodels=c(model1,model2,model3),
                                                   exposure=c("A0","A1","A2"),
                                                   data=DataSetFull[[iiii]])$coef)
round(listMean(estimationSG),3)
     (Intercept)    A0    A1    A2 A0*A1  A0*A2  A1*A2 A0*A1*A2
Est.      -0.007 6.009 3.996 5.002     0 -2.004 -1.005        0


estimationSG.NA<-lapply(1:loop,function(iiii) g.dicho(mmodels=c(model1,model2,model3),
                                                      exposure=c("A0","A1","A2"),
                                                      data=DataSetMonotone[[iiii]])$coef)
round(listMean(estimationSG.NA),3)
     (Intercept)    A0    A1    A2 A0*A1  A0*A2  A1*A2 A0*A1*A2
Est.      -0.249 6.443 3.555 5.743     0 -2.551 -0.782        0
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
