context("raw_swap_endian")

test_that("raw_swap_endian works", {
  raw_vec <- as.raw(c(1, 2, 3, 4, 5, 6, 7, 8))

  output  <- raw_swap_endian(raw_vec, nbytes=2)
  expect_identical(as.raw(c(2, 1, 4, 3, 6, 5, 8, 7)), output)

  output  <- raw_swap_endian(raw_vec, nbytes=4)
  expect_identical(as.raw(c(4, 3, 2, 1, 8, 7, 6, 5)), output)

  output  <- raw_swap_endian(raw_vec, nbytes=8)
  expect_identical(as.raw(c(8, 7, 6, 5, 4, 3, 2, 1)), output)
})


test_that("raw_swap_endian raises proper errors", {
  raw_vec <- as.raw(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16))

  expect_error(output  <- raw_swap_endian(raw_vec, nbytes= 3), "N%%nbytes == 0L is not TRUE")


  raw_vec <- as.raw(c())
  expect_error(output  <- raw_swap_endian(raw_vec, nbytes=8), "N >= nbytes is not TRUE")
})

