\name{seq.dr.mediator}
\alias{seq.dr.mediator}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The estimator for the sequential mediation that utilizes data with missing observations
}
\description{

}
\usage{
seq.dr.mediator(mmodels, exposure, int, covariates, regList, augList=NULL, data, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{mmodels}{
Models corresponding to response.
}
\item{exposure}{
The time-varying exposure.
}
\item{int}{
The exposure of interest for the mediation analysis.
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
All the models are linear by default (\code{augList}=NULL)
}
\item{data}{
Data.
}
\item{\dots}{
%%
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{coef}{
The coefficients from the analysis of the direct effect and the indirect effects.
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
\item{regList}{
The list consist of the models to estimate the probabilities for the missingness in data.
See the function \code{\link{missing.pattern}}.
}
\item{augList}{
The list consist of the models of the Augmentations space.
}
\item{count}{
The number of the observed variables in integers.
}
\item{CoefList}{
The coefficients form the regression models (exist if \code{list.out} is equal to TRUE).
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
p<-function(x)exp(x)/(1+exp(x))
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
