#' Kill factors in dataframe
#'
#' Converts all factor variables in a given dataframe to character variables.
#'
#' @param x A dataframe.
#' @param targets The names of factor variables to be converted into character variables.
#'
#' @return tbl_df A dataframe with all (or the targetted) factor variables converted to character variables.
#' @export
#'
#' @examples
#' #Convert all the factor variables in the dataframe to character variabels.
#' die_factors(iris)
#'
#' #Convert only the Species variable into a character.
#' die_factors(iris, "Species")
#'
#' #Convert only the variable at column 5 into a character
#' die_factors(iris, 5)
#' @importFrom dplyr %>%
die_factors <- function(x, targets = NULL) {
  stopifnot(is.data.frame(x) & (is.null(targets)|is.numeric(targets)|is.character(targets)))
  vars_to_select <- targets
  if (is.null(targets)){
    df_to_return <- x %>% purrr::map_if(is.factor, as.character) %>% dplyr::tbl_df()
    return(dplyr::tbl_df(data.table::setcolorder(df_to_return, names(x))))
  }
  else {
    if (is.character(targets)) {
      if(any(stringr::str_detect(targets, "-"))){
        vars_to_select <- (match(stringr::str_replace_all(targets, "-", ""),
                                 names(x)))
        if (any(is.na(vars_to_select))) {stop("Oh no, some of the variables you targetted do not exist!")}
      vars_to_select <- vars_to_select*-1
        }
      else {
        vars_to_select <- match(targets, names(x))
        if (any(is.na(vars_to_select))) {stop("Oh no, some of the variables you targetted do not exist!")}
      }
    }
    else {
      vars_to_select <- targets
      if (any(abs(vars_to_select) > ncol(x))) {stop("Oh no, some of the variables you targetted do not exist!")}

    }
    df_vars_to_change <- x %>% dplyr::select(vars_to_select)
    df_vars_to_ignore <- x %>% dplyr::select(vars_to_select*-1)
    factor_test <- df_vars_to_change %>% purrr::map_lgl(is.factor) %>% as.numeric()
    sum_of_not_factors <- sum(factor_test==0)
    if (sum_of_not_factors == length(factor_test)) {
      message("All of the targets you provided were not factors.
              The data frame was not changed.")
    }
    else if (sum_of_not_factors > 0) {
      message("Some of the targets you provided were not factors. Only the targets
              that were factors were made into characters")
    }
    df_changed_vars <- df_vars_to_change %>% purrr::map_if(is.factor, as.character)
    df_to_return <- dplyr::bind_cols(df_changed_vars, df_vars_to_ignore)
    return(dplyr::tbl_df(data.table::setcolorder(df_to_return, names(x))))
    }
  }
