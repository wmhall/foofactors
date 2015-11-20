<!-- README.md is generated from README.Rmd. Please edit that file -->
foofactors
==========

This is a package for [STAT 545](http://stat545-ubc.github.io) homework 8.

I added a new function to the `foofactors` package: `die_factors`

`die_factors` takes factors variables in a dataframe and converts them to characters variables. The default functionality is to take all the factor variables in a given dataframe and convert them to character variables. You can target (and ignore) factor variables by specifying the variable names when calling the function.

Installation
------------

``` r
devtools::install_github("wmhall/foofactors")
```

`die_factors` usage
-------------------

The following example uses `die_factors` to convert all the factor variables in the gapminder data frame into character variables. Start by loading the `foofactors` package and the `gapminder` package.

``` r
library(foofactors)
library(gapminder)
```

If we take a look at the `gapminder` data we see there are two factor variables: country and continent.

``` r
str(gapminder)
#> 'data.frame':    1704 obs. of  6 variables:
#>  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
#>  $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
#>  $ year     : num  1952 1957 1962 1967 1972 ...
#>  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
#>  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
#>  $ gdpPercap: num  779 821 853 836 740 ...
```

We can convert all the factor variables into character variables with the `die_factors` function.

``` r
my_new_df <- die_factors(gapminder)
```

To check it worked we can use the str() function. You can see that the country and continent variables are now character variables.

``` r
str(my_new_df)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    1704 obs. of  6 variables:
#>  $ country  : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
#>  $ continent: chr  "Asia" "Asia" "Asia" "Asia" ...
#>  $ year     : num  1952 1957 1962 1967 1972 ...
#>  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
#>  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
#>  $ gdpPercap: num  779 821 853 836 740 ...
```

We can target specific variables with `die_factors` by specifying them by name.

``` r
my_new_df <- die_factors(gapminder, "country")
```

Now `die_factors` has only changed the country variable. The continent variable remains a factor

``` r
str(my_new_df)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    1704 obs. of  6 variables:
#>  $ country  : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
#>  $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
#>  $ year     : num  1952 1957 1962 1967 1972 ...
#>  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
#>  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
#>  $ gdpPercap: num  779 821 853 836 740 ...
```

We can also target variables using the numeric column numbers.

``` r
my_new_df <- die_factors(gapminder, 2)
```

`die_factors` has only changed the continent variable.

``` r
str(my_new_df)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    1704 obs. of  6 variables:
#>  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
#>  $ continent: chr  "Asia" "Asia" "Asia" "Asia" ...
#>  $ year     : num  1952 1957 1962 1967 1972 ...
#>  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
#>  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
#>  $ gdpPercap: num  779 821 853 836 740 ...
```

You can tell `die_factors` to not target a variable by putting a minus sign before a variable name or column number. You'll notice that `die_factors` gives you message indicating that some of the variable that were targeted were not factors and that those variables will remain unchanged. This is because `die_factors` is targeting all of the variables except the country variable.

``` r
my_new_df <- die_factors(gapminder, "-country")
#> Some of the targets you provided were not factors. Only the targets
#>               that were factors were made into characters
```

You can see that only the continent variable was changed.

``` r
str(my_new_df)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    1704 obs. of  6 variables:
#>  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
#>  $ continent: chr  "Asia" "Asia" "Asia" "Asia" ...
#>  $ year     : num  1952 1957 1962 1967 1972 ...
#>  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
#>  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
#>  $ gdpPercap: num  779 821 853 836 740 ...
```

You can do the same thing by putting a minus sign in front of numerical column positions.

``` r
my_new_df <- die_factors(gapminder, -1)
#> Some of the targets you provided were not factors. Only the targets
#>               that were factors were made into characters
```

Only the continent variable has been changed.

``` r
str(my_new_df)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    1704 obs. of  6 variables:
#>  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
#>  $ continent: chr  "Asia" "Asia" "Asia" "Asia" ...
#>  $ year     : num  1952 1957 1962 1967 1972 ...
#>  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
#>  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
#>  $ gdpPercap: num  779 821 853 836 740 ...
```

Finally, you can pass `die_factors` groups of variables to target. The variables can be specified by name.

``` r
my_new_df <- die_factors(gapminder, c("country", "year", "continent"))
#> Some of the targets you provided were not factors. Only the targets
#>               that were factors were made into characters
```

You'll see that country and continent were changed to character variables but year remains unchanged. Year is not changed because it is not a factor.

``` r
str(my_new_df)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    1704 obs. of  6 variables:
#>  $ country  : chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
#>  $ continent: chr  "Asia" "Asia" "Asia" "Asia" ...
#>  $ year     : num  1952 1957 1962 1967 1972 ...
#>  $ lifeExp  : num  28.8 30.3 32 34 36.1 ...
#>  $ pop      : num  8425333 9240934 10267083 11537966 13079460 ...
#>  $ gdpPercap: num  779 821 853 836 740 ...
```
