\name{missing.pattern}
\alias{missing.pattern}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
missing.pattern
}
\description{
  A concise (1-5 lines) description of what the function does. 
}
\usage{
missing.pattern(response, covariates, data, pattern, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{response}{
The outcome variable of the interest.
}
\item{covariates}{
The ordered sequence of the variables of the interest without the response.
}
\item{data}{
Data.
}
\item{\dots}{

}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{data}{
The data of the chosen pattern of missingness (used in the function \code{\link{prob.of.missing}}).
}
\item{covariatesObj}{
The ordered sequence of the variables of the interest (used in the function \code{\link{prob.of.missing}}).
}
\item{responseObj}{
The outcome variable of the interest (used in the function \code{\link{prob.of.missing}}).
}
\item{count}{
The number of the observed variables in integers.
}
\item{percent}{
The percent of the observed variables.
}
}
\references{
Tsiatis, Anastasios A., A. A. (2006). Semiparametric theory and missing data. Springer series in statistics.
Springer.
}
\author{
Thomas Maltesen
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
See \code{\link{prob.of.missing}}.
}
\examples{
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
