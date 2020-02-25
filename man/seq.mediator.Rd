\name{seq.mediator}
\alias{seq.mediator}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The augmented inverse probability weighting
}
\description{
The function solves the estimator to
gfg.
}
\usage{
seq.mediator(mmodels, exposure, int, data, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mmodels}{
The models correspond to the models the outcome.
}
  \item{exposure}{
The exposure.
}
  \item{int}{
The exposure of interest for the mediation analysis.
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
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{mmodels}{
The mmodels that have been used for modeling data.
}
\item{coef}{
The coefficients from the analysis of the direct effect and the indirect effects.
}
\item{exposure}{
The exposure of the analysis.
}
\item{N}{
The sample size of data.
}
\item{NCC}{
The sample size of complete cases of data. In case of no missing values NCC is equal to N.
}
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
