context("test-pad-logical-vec")

test_that("pad_logical_vec works", {

  logical_vec <- as.logical(c(0, 1, 1, 1))

  res <- pad_logical_vec(logical_vec, pad = 'left', multiple = 8, value = FALSE)
  expect_length(res, 8)
  expect_identical(res, as.logical(c(0, 0, 0, 0,  0, 1, 1, 1)))


  res <- pad_logical_vec(logical_vec, pad = 'left', multiple = 8, value = TRUE)
  expect_length(res, 8)
  expect_identical(res, as.logical(c(1, 1, 1, 1,  0, 1, 1, 1)))


  res <- pad_logical_vec(logical_vec, pad = 'left', multiple = 16, value = FALSE)
  expect_length(res, 16)
  expect_identical(res, as.logical(c(0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 1, 1, 1)))


  res <- pad_logical_vec(logical_vec, pad = 'right', multiple = 8, value = FALSE)
  expect_length(res, 8)
  expect_identical(res, as.logical(c(0, 1, 1, 1,  0, 0, 0, 0)))


  res <- pad_logical_vec(logical_vec, pad = 'right', multiple = 8, value = TRUE)
  expect_length(res, 8)
  expect_identical(res, as.logical(c(0, 1, 1, 1,  1, 1, 1, 1)))



})
