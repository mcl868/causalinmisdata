\name{g.dr.dicho}
\alias{g.dr.dicho}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The estimator for the g-formula that utilizes data with missing observations
}
\description{

}
\usage{
g.dr.dicho(mmodels, exposure, covariates, pattern, regList, data, aug = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{mmodels}{
Models corresponding to response.
}
\item{exposure}{
The time-varying exposure.
}
\item{covariates}{
The ordered sequence of the variables of the interest without the response.
}
\item{regList}{
The list consist of the models to estimate the probabilities for the missingness in data.
See the function missing.pattern.
}
\item{augList}{
The list consist of the models of the Augmentations space.
All the models are linear by default (augList=NULL)
}
\item{data}{
Data.
}
\item{...}{

}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{ExpectEstimate}{
The expected value of the potential outcome.
}
\item{coef}{
The coefficients in marginal strucktural model.
}
\item{mmodels}{
The mmodels that have been used for modeling data.
}
\item{N}{
The sample size of data.
}
\item{NCC}{
The sample size of complete cases of data. In case of no missing values NCC is equal to N.
}
\item{exposure}{
The exposure of the analysis.
}
\item{augList}{
The list consist of the models of the Augmentations space.
All the models are linear by default (\code{augList}=NULL)
}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
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
See also \code{\link{g.dicho}}.
}
\examples{
\dontrun{
model1 <- Y ~ L0 + A0 + L1 + A1 + L2 + A2 + L2*A2
model2 <- L2 ~ A1 + L1 + A0 + L0
model3 <- L1 ~ A0 + L0 + A0*L0


estimationSG.NA<-lapply(1:loop,function(iiii) g.dicho(mmodels=c(model1,model2,model3),
                                                      exposure=c("A0","A1","A2"),
                                                      data=DataSetMonotone[[iiii]])$coef)
round(listMean(estimationSG.NA),3)
     (Intercept)    A0    A1    A2 A0*A1  A0*A2  A1*A2 A0*A1*A2
Est.      -0.249 6.443 3.555 5.743     0 -2.551 -0.782        0

estimationMis.SG<-lapply(1:loop,function(iiii) g.dr.dicho(mmodels=c(model1,model2,model3),
                                                          exposure=c("A0","A1","A2"),
                                                          data=DataSetMonotone[[iiii]],
                                                          covariates=c("L0","A0","L1","A1","L2","A2"),
                                                          regList=regList)$coef)
round(listMean(estimationMis.SG),3)
     (Intercept)    A0 A1    A2 A0*A1  A0*A2  A1*A2 A0*A1*A2
Est.      -0.016 6.015  4 5.015     0 -2.004 -1.004        0
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
