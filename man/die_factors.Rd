% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/die_factors.R
\name{die_factors}
\alias{die_factors}
\title{Kill factors in dataframe}
\usage{
die_factors(x, targets = NULL)
}
\arguments{
\item{x}{A dataframe.}

\item{targets}{The names of factor variables to be converted into character variables.}
}
\value{
tbl_df A dataframe with all (or the targetted) factor variables converted to character variables.
}
\description{
Converts all factor variables in a given dataframe to character variables.
}
\examples{
#Convert all the factor variables in the dataframe to character variabels.
die_factors(iris)

#Convert only the Species variable into a character.
die_factors(iris, "Species")

#Convert only the variable at column 5 into a character
die_factors(iris, 5)
}

