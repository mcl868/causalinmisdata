\name{monotone.pattern}
\alias{monotone.pattern}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
monotone.pattern
}
\description{
  A concise (1-5 lines) description of what the function does. 
}
\usage{
monotone.pattern(measurements, dataset, id=NULL, transform=TRUE, threshold=0.05, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{measurements}{
The ordered sequence of the variables of the interest including the outcome.
}
\item{data}{
Data.
}
\item{id}{
If data variable of id.
}
\item{transform}{
If it is equal to TRUE* then all records following a nonmontone are set
to follow a monotone pattern.
*If it is equal to FALSE* then all records following a nonmontone are remain the same.
}
\item{threshold}{
Remove pattern of from the monoene missingness if the percent of specific records
is below the threshold
}
\item{\dots}{

}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{data}{
Data.
}
\item{transformnb}{
Contain the position of the record in data if the record follows a nonmontone
pattern. (If \code{transform}=TRUE).
}
\item{tableC}{
The number of the observed variables in integers. See the function **missing.pattern**.
(If \code{transform}=TRUE).
}
\item{tableCpercent}{
The percent of the observed variables.
(If \code{transform}=TRUE).
}
\item{threshold}{
The value of the threshold.
(If \code{transform}=TRUE).
}
\item{datasetredu}{
The records are removed from data if there are to few records of a specific pattern
below the threshold.
(If \code{transform}=TRUE).
}
\item{tableCredu}{
The number of the observed variables in integers for the reduced data.
See the function **missing.pattern**. (If *transform=TRUE*).
}
\item{tableCpercentredu}{
The percent of the observed variables for the reduced data.
(If \code{transform}=TRUE).
}
\item{nonmonotone}{
Contain the position of the record in data if the record follows a nonmontone
pattern. (If \code{transform}=FALSE)
}
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
See also \code{\link{DatawMis}}.
}
\examples{
\dontrun{
DataSetnonMonotone.extra<-
lapply(1:loop,function(iiii)
       monotone.pattern(measurements=c("L0","A0","L1","A1","L2","A2","Y"),
                        data=DataSetnonMonotone[[iiii]],
                        id=NULL,
                        transform=TRUE,
                        threshold=0.05))

listMean(lapply(1:loop,function(iiii)length(DataSetnonMonotone.extra[[iiii]]$transformnb)))
  926.57
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
