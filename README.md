<!-- README.md is generated from README.Rmd. Please edit that file -->
This is a package for [STAT 545](http://stat545-ubc.github.io) homework 8.

I added two new functions to the `foofactors` package: `die_factors` and `live_factors`

`die_factors` takes factors in a dataframe and convert them to characters. The default functionality is to take all the factors in a given dataframe and convert them to characters. You can target (and ignore) factor variables by specifying the variable names when calling the function.

`live_factors` takes characters in a dataframe and convert them to factors. Like `die_factors`, you can target (and ignore) character variables by specifying the variable namess when calling the function.

Installation
============

``` r
#devtools::install_github("wmhall/foofactors")
```

`die_factors` Examples
======================

The following example uses foofactor to convert all the factor variables in the gapminder data frame into character variables.

``` r
library(foofactors)
library(gapminder)
#> Warning: package 'gapminder' was built under R version 3.2.2
library(dplyr)
#> Warning: package 'dplyr' was built under R version 3.2.2
#> 
#> Attaching package: 'dplyr'
#> 
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> 
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

tbl_df(gapminder)
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>         (fctr)    (fctr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
die_factors(gapminder)
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>          (chr)     (chr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
```

You can target specific variables to convert into factors by specifying the variable names when calling the `die_factors`

``` r
tbl_df(gapminder)
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>         (fctr)    (fctr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
die_factors(gapminder, "country")
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>          (chr)    (fctr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
```

You can also specify factors using the numerical column positions.

``` r
tbl_df(gapminder)
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>         (fctr)    (fctr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
die_factors(gapminder, 1)
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>          (chr)    (fctr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
```

You can ignore a factor by using the minus sign in front of you column specification. For example, the below code will convert all factor variables to character variables, except the first column.

``` r
tbl_df(gapminder)
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>         (fctr)    (fctr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
die_factors(gapminder, -1)
#> Some of the targets you provided were not factors. Only the targets
#>               that were factors were made into characters
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>         (fctr)     (chr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
```

You can also ignore a variable by appending a minus sign to the variable name that you would like to ignore. For example, you can tell `die_factors` to not convert the country variable to a character with the following command.

``` r
tbl_df(gapminder)
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>         (fctr)    (fctr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
die_factors(gapminder, "-country")
#> Some of the targets you provided were not factors. Only the targets
#>               that were factors were made into characters
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>         (fctr)     (chr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
```

Finally, if you target a group of variables and some of the variables are not factors, `die_factors` will only convert the variable that are factors to character variables and will provide a friendly message indicating that some of the variable were not modified because they are not factors.

``` r
tbl_df(gapminder)
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>         (fctr)    (fctr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
die_factors(gapminder, c("country", "year", "continent"))
#> Some of the targets you provided were not factors. Only the targets
#>               that were factors were made into characters
#> Source: local data frame [1,704 x 6]
#> 
#>        country continent  year lifeExp      pop gdpPercap
#>          (chr)     (chr) (dbl)   (dbl)    (dbl)     (dbl)
#> 1  Afghanistan      Asia  1952  28.801  8425333  779.4453
#> 2  Afghanistan      Asia  1957  30.332  9240934  820.8530
#> 3  Afghanistan      Asia  1962  31.997 10267083  853.1007
#> 4  Afghanistan      Asia  1967  34.020 11537966  836.1971
#> 5  Afghanistan      Asia  1972  36.088 13079460  739.9811
#> 6  Afghanistan      Asia  1977  38.438 14880372  786.1134
#> 7  Afghanistan      Asia  1982  39.854 12881816  978.0114
#> 8  Afghanistan      Asia  1987  40.822 13867957  852.3959
#> 9  Afghanistan      Asia  1992  41.674 16317921  649.3414
#> 10 Afghanistan      Asia  1997  41.763 22227415  635.3414
#> ..         ...       ...   ...     ...      ...       ...
```
