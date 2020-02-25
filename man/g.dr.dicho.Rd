\name{g.dr.dicho}
\alias{g.dr.dicho}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The augmented inverse probability weighting complete case
}
\description{
  A concise (1-5 lines) description of what the function does. 
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
%%
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
The sample size of complete cases of data. In case of no missing values *NCC* is equal to *N*.
}
\item{exposure}{
The exposure of the analysis.
}
\item{augList}{
The list consist of the models of the Augmentations space.
All the models are linear by default (augList=NULL)
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
