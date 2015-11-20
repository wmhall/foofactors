context("Killing factors")

test_that("die_factors makes factors into characters", {
  iris_no_factors <- die_factors(iris)
  expect_true(is.character(iris_no_factors$Species))
  iris_with_factors <- die_factors(iris, "-Species")
  expect_true(is.factor (iris_with_factors$Species))
})
