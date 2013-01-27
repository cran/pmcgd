\name{MS}
\alias{MS}
\title{Fitting for the Parsimonious Mixtures of Contaminated Gaussian Distributions}
\description{
Carries out model-based clustering or model-based classification using some or all of the 14 parsimonious mixtures of contaminated Gaussian Distributions by using the ECM algorithm.
Likelihood-based model-selection criteria are used to select the best model and the number of mixture components.
}
\usage{
MS(X, k, model = NULL, initialization = "mclust",
   alphacon = TRUE, alphamin = NULL, alphafix = FALSE, alpha = NULL,
   etacon = TRUE, etafix = FALSE, eta = NULL, etamax = 200, 
	 start.z = NULL, start.v = NULL, start = 0,
   ind.label = NULL, label = NULL, iter.max = 1000, threshold = 1.0e-03)  
}
                 
%- maybe also 'usage' for other objects documented here.
\arguments{                      
  \item{X}{
  A matrix or data frame such that rows correspond to observations and columns correspond to variables. 
  Note that this function currently only works with multivariate data (\eqn{p > 1}).
  }
  \item{k}{
  a vector containing the numbers of groups to be tried. 
  }
  \item{model}{
  vector indicating the models (i.e., the covariance structures: "EII", "VII", "EEI", "VEI", "EVI", "VVI", "EEE", "VEE", "EVE", "EEV", "VVE", "VEV", "EVV", "VVV") to be used.
	If \code{NULL}, then all 14 models are fitted.
  }
  \item{initialization}{
  initialization strategy for the ECM-algorithm. 
  It can be:
  \itemize{
    \item \code{"mclust"}: posterior probabilities from mixtures of Gaussian distributions are used for initialization;
    \item \code{"random.soft"}: initial posterior probabilities are random generated; 
    \item \code{"random.hard"}: initial classification matrix is random generated;
    \item \code{"manual"}: the user must specify, via the arguments \code{start.z} and \code{start.v}, posterior probabilities or classification matrix for the mixture components and the 3D array of membership to the ``good'' and ``bad'' groups in each mixture component, respectively.
  }
  Default value is \code{"mclust"}.
  }
  \item{alphacon}{
  if \code{TRUE}, the vector with proportions of good observations is constrained to be greater than the vector specified by the \code{alphamin} argument. 
  }
  \item{alphamin}{
  when \code{alphacon=TRUE}, vector with minimum proportions of good observations in each group. 
  }
  \item{alphafix}{
  when \code{alphafix=TRUE}, the vector of proportions of good observations is fixed to the vector specified in the \code{alpha} argument. 
  }
  \item{alpha}{
  vector of proportions of good observations in each group to be considered when \code{alphafix=TRUE}. 
  }
  \item{etacon}{
  if \code{TRUE}, the contaminated parameters are all constrained to be greater than one. 
  }
  \item{etafix}{
  if \code{TRUE}, the vector of contaminated parameters is fixed to the vector specified by the \code{eta} argument. 
  }
  \item{eta}{
  vector of contaminated parameters to be considered when \code{etafix}. 
  }
  \item{etamax}{
  maximum value for the contamination parameters to be considered in the estimation phase when \code{etafix=FALSE}. 
  }
  \item{start.z}{
  matrix of soft or hard classification; it is used only if \code{initialization="manual"}. 
  }
  \item{start.v}{
  3D array of soft or hard classification to the good and bad groups in each mixture components. 
  It is used as initialization when \code{initialization="manual"}. 
  }
  \item{start}{
  when \code{initialization="manual"}, initialization used for the \code{gpcm()} function of the \pkg{mixture} package (see \code{\link[mixture:gpcm]{mixture:gpcm}} for details). 
  }
  \item{ind.label}{
  vector of positions (rows) of the labeled observations. 
  }
  \item{label}{
  vector, of the same dimension as \code{ind.label}, with the group of membership of the observations indicated in the \code{ind.label} argument. 
  }
  \item{iter.max}{
  maximum number of iterations in the ECM-algorithm. 
	Default value is 1000. 
  }
  \item{threshold}{
  threshold for Aitken's acceleration procedure. 
	Default value is 1.0e-03. 
  }  
}
\details{
The multivariate data contained in \code{X} are either clustered or classified using parsimonious mixtures of contaminated Gaussian densities with some or all of the 14 parsimonious covariance structures described in Punzo & McNicholas (2013).
The algorithms given by Browne & McNicholas (2013) are considered (see also Celeux & Govaert, 1995, for all the models apart from "EVE" and "VVE").  
Starting values are very important to the successful operation of these algorithms and so care must be taken in the interpretation of results.
}
\value{
An object of class \code{pmcgd} is a list with components:
	\item{call}{an object of class \code{call}}
	\item{best}{a data frame with the best number of mixture components (first column) and the best model (second column) with respect to the three model selection criteria adopted (AIC, BIC, and ICL)}
	\item{bestAIC,bestBIC,bestICL}{for the best AIC, BIC, and ICL models, these are three lists (of the same type) with components:
		\itemize{
		\item \code{modelname}: the name of the best model.
		\item \code{npar}: number of free parameters.
		\item \code{X}: matrix of data.
		\item \code{k}: number of mixture components.
		\item \code{p}: number of variables.
		\item \code{prior}: weights for the mixture components.
		\item \code{priorgood}: weights for the good observations in each of the \code{k} groups.
		\item \code{mu}: component means.
		\item \code{Sigma}: component covariance matrices for the good observations.
		\item \code{lambda}: component volumes for the good observations.	
		\item \code{Delta}: component shape matrices for the good observations.
		\item \code{Gamma}: component orientation matrices for the good observations.
		\item \code{eta}: component contamination parameters.	
		\item \code{iter.stop}: final iteration of the ECM algorithm.
		\item \code{z}: matrix with posterior probabilities for the outer groups.
		\item \code{v}: matrix with posterior probabilities for the inner groups.
		\item \code{group}: vector of integers indicating the maximum a posteriori classifications for the best model.
		\item \code{loglik}: log-likelihood value of the best model.	
		\item \code{AIC}: AIC value	
		\item \code{BIC}: BIC value	
		\item \code{ICL:} ICL value	
		\item \code{call}: an object of class \code{call} for the best model.
		}		
	}
}

\references{
Punzo, A., and McNicholas, P. D. (2013). Outlier Detection via Parsimonious Mixtures of Contaminated Gaussian Distributions. \emph{arXiv.org} e-print \bold{1305.4669}, available at: \url{http://arxiv.org/abs/1305.4669}.

Browne, R. P. and McNicholas, P. D. (2013). \pkg{mixture}: Mixture Models for Clustering and Classification. R package version 1.0.

Celeux, G. and Govaert, G. (1995). Gaussian Parsimonious Clustering Models. \emph{Pattern Recognition}. \bold{28}(5), 781-793.
}
\author{
Punzo A. and McNicholas P. D.
}
%%\note{
%%  ~~further notes~~
%%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{                  
\code{\link{pmcgd-package}}, \code{\link{class}}
}
\examples{

# Artificial data from an EEI model with k=2 components

library(mnormt)
p   <- 2
k   <- 2
eta <- c(8,8) # contamination parameters
set.seed(12345)
X1good <- rmnorm(n = 300, mean = rep(3,p), varcov = diag(c(5,0.5)))
X2good <- rmnorm(n = 300, mean = rep(-3,p), varcov = diag(c(5,0.5)))
X1bad  <- rmnorm(n = 30, mean = rep(3,p), varcov = eta[1]*diag(c(5,0.5)))
X2bad  <- rmnorm(n = 30, mean = rep(-3,p), varcov = eta[2]*diag(c(5,0.5)))
X      <- rbind(X1good,X1bad,X2good,X2bad)
plot(X, pch = 16, cex = 0.8)

# model-based clustering with the whole family of 14 
# parsimonious models and number of groups ranging from 1 to 3

overallfit <- MS(X, k = 1:2, model = c("EEI","VVV"), initialization = "mclust")  

# to see the best BIC results

bestBIC <- overallfit$bestBIC

# plot of the best BIC model

plot(X, xlab = expression(X[1]), ylab = expression(X[2]), col = "white")
text(X, labels = bestBIC$detection$innergroup, col = bestBIC$group, cex = 0.7, asp = 1)
box(col = "black")

}

