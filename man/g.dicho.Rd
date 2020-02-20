\name{g.dicho}
\alias{g.dicho}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The augmented inverse probability weighting
}
\description{
The function solves the estimator to
\begin{center}
sum
\end{center}
gfg.
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
The exposure.
}
  \item{data}{
%%
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
