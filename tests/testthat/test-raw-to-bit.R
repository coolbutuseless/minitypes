context("test-raw_to_bit")

test_that("raw_to_bit works", {

  raw_vec <- as.raw(1)
  res <- raw_to_bit(raw_vec, first_bit = 'msb')
  expect_identical(res, bit::as.bit(c(F, F, F, F, F, F, F, T)))

  raw_vec <- as.raw(2)
  res <- raw_to_bit(raw_vec, first_bit = 'msb')
  expect_identical(res, bit::as.bit(c(F, F, F, F, F, F, T, F)))


  raw_vec <- as.raw(1)
  res <- raw_to_bit(raw_vec, first_bit = 'lsb')
  expect_identical(res, bit::as.bit(c(T, F, F, F, F, F, F, F)))

  raw_vec <- as.raw(2)
  res <- raw_to_bit(raw_vec, first_bit = 'lsb')
  expect_identical(res, bit::as.bit(c(F, T, F, F, F, F, F, F)))




  raw_vec <- as.raw(1:2)
  res <- raw_to_bit(raw_vec, first_bit = 'msb')
  expect_identical(res, bit::as.bit(c(F, F, F, F, F, F, F, T,
                                      F, F, F, F, F, F, T, F)))


  raw_vec <- as.raw(1:2)
  res <- raw_to_bit(raw_vec, first_bit = 'lsb')
  expect_identical(res, bit::as.bit(c(T, F, F, F, F, F, F, F,
                                      F, T, F, F, F, F, F, F)))

})



test_that("raw_to_logical works", {

  raw_vec <- as.raw(1)
  res <- raw_to_logical(raw_vec, first_bit = 'msb')
  expect_identical(res, c(F, F, F, F, F, F, F, T))

  raw_vec <- as.raw(2)
  res <- raw_to_logical(raw_vec, first_bit = 'msb')
  expect_identical(res, c(F, F, F, F, F, F, T, F))


  raw_vec <- as.raw(1)
  res <- raw_to_logical(raw_vec, first_bit = 'lsb')
  expect_identical(res, c(T, F, F, F, F, F, F, F))

  raw_vec <- as.raw(2)
  res <- raw_to_logical(raw_vec, first_bit = 'lsb')
  expect_identical(res, c(F, T, F, F, F, F, F, F))




  raw_vec <- as.raw(1:2)
  res <- raw_to_logical(raw_vec, first_bit = 'msb')
  expect_identical(res, c(F, F, F, F, F, F, F, T,
                                      F, F, F, F, F, F, T, F))


  raw_vec <- as.raw(1:2)
  res <- raw_to_logical(raw_vec, first_bit = 'lsb')
  expect_identical(res, c(T, F, F, F, F, F, F, F,
                                      F, T, F, F, F, F, F, F))

})
