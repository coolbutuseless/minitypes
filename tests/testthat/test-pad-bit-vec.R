context("test-pad-bit-vec")

test_that("pad_bit_vec works", {

  bit_vec <- bit::as.bit(c(0, 1, 1, 1))

  res <- pad_bit_vec(bit_vec, pad = 'left', multiple = 8, value = FALSE)
  expect_length(res, 8)
  expect_identical(res, bit::as.bit(c(0, 0, 0, 0,  0, 1, 1, 1)))


  res <- pad_bit_vec(bit_vec, pad = 'left', multiple = 8, value = TRUE)
  expect_length(res, 8)
  expect_identical(res, bit::as.bit(c(1, 1, 1, 1,  0, 1, 1, 1)))


  res <- pad_bit_vec(bit_vec, pad = 'left', multiple = 16, value = FALSE)
  expect_length(res, 16)
  expect_identical(res, bit::as.bit(c(0, 0, 0, 0,  0, 0, 0, 0,  0, 0, 0, 0,  0, 1, 1, 1)))


  res <- pad_bit_vec(bit_vec, pad = 'right', multiple = 8, value = FALSE)
  expect_length(res, 8)
  expect_identical(res, bit::as.bit(c(0, 1, 1, 1,  0, 0, 0, 0)))


  res <- pad_bit_vec(bit_vec, pad = 'right', multiple = 8, value = TRUE)
  expect_length(res, 8)
  expect_equal(as.logical(res[1:8]), as.logical(c(0, 1, 1, 1,  1, 1, 1, 1)))



})
