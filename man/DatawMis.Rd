\name{DatawMis}
\alias{DatawMis}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Data with monotone missingness and nonmonotone missingness.
}
\arguments{
\item{L0}{
Baseline measurement.
}
\item{A0}{
The exposure after baseline measurement.
}
\item{L1}{
Confounder for the two exposure A1 and A2.
}
\item{A1}{
The exposure at time 1.
}
\item{L2}{
Confounder for the exposure A2.
}
\item{A2}{
The exposure at time 2.
}
\item{Y}{
The outcome.
}
}
\description{
The data by the name "DataSetFull" contain the data with full data.
The data by the name "DataSetMonotone" contain the data with missing observation following a monotone pattern.
The missigness follow coarsening at random.
The data by the name "DataSetnonMonotone" contain the data with missing observation following a nonmonotone pattern.
}
\usage{
}
%- maybe also 'usage' for other objects documented here.
\arguments{
%  \item{mmodels}{
%The models correspond to the models the outcome.
%}
%  \item{exposure}{
%The exposure.
%}
%  \item{int}{
%The exposure of interest for the mediation analysis.
%}
%\item{data}{
%Data.
%}
%\item{\dots}{
%%
%}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{

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

L0<-rnorm(10000)
A0<-1*(runif(10000,0,1)<=p(0.6*L0))

L1<--A0+0.2*L0-1*A0*L0+rnorm(10000)
A1<-1*(runif(10000,0,1)<=p(-1+1.6*A0+1.2*L1-0.8*L0-1.6*L1*A0))

L2<--A1+1*L1-A0+1.2*L0+rnorm(10000)
A2<-1*(runif(10000,0,1)<=p(1-0.8*L0+1.6*A0+1.2*L1+1.3*A1+0.5*L2+1.6*L1*A1))

Y<-2*L0+3*A0+1*L1+2*A1-2*L2+5*A2+L2*A2+rnorm(10000)

DataSet<-data.frame(L0, L1, L2, A0, A1, A2, Y)
rm(list=c("L0","A0","L1","A1","L2","A2","Y"))

model1 <- Y ~ L0 + A0 + L1 + A1 + L2 + A2 + L2*A2
model2 <- model1 ~ A1 + L1 + A0 + L0
model3 <- model2 ~ A0 + L0 + A0*L0

g.aipw.dicho(mmodels=c(model1,model2,model3), 
             exposure=c("A0","A1","A2"), 
             data=DataSet)
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
