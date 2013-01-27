\name{class}
\alias{class}
\title{Matrix of Indicator Variables given Classification}
\description{
Converts a classification vector into a matrix of indicator variables.
}
\usage{
class(groups, k)  
}
                 
%- maybe also 'usage' for other objects documented here.
\arguments{                      
  \item{groups}{
  A numeric vector of integers. 
	Typically the distinct entries of this vector would represent a classification of observations in a data set.
  }
  \item{k}{
  An integer indicating the number of groups. 
  }
}
\value{
An \eqn{n} (number of observations) by \eqn{k} (number of groups) matrix of (0,1) indicator variables. 
The \code{[i,j]}th entry is 1 if \code{groups[i]} is \code{j} and 0 otherwise.
}

\references{
Punzo, A., and McNicholas, P. D. (2013). Outlier Detection via Parsimonious Mixtures of Contaminated Gaussian Distributions. \emph{arXiv.org} e-print \bold{1305.4669}, available at: \url{http://arxiv.org/abs/1305.4669}.
}
\author{
Punzo A. and McNicholas P. D.
}
%%\note{
%%  ~~further notes~~
%%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{                  
\code{\link{pmcgd-package}},\code{\link{MS}}
}
\examples{

n <- 20
k <- 3
prob <- c(0.5,0.3,0.2)
groups <- sample(1:k, size=n, replace = TRUE, prob = prob)
matclass <- class(groups, k)
matclass

}

