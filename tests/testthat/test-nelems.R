context("test-nelems")

test_that("multiplication works", {

  a <- 1:3
  h <- convert_type(a, 'uint8', 'hex8')

  b <- convert_type(a, 'uint8', 'bitstring')

  expect_equal(nelems(a, 'uint8'), length(a))
  expect_equal(nelems(h, 'hex8'), length(h))
  expect_equal(nelems(b, 'bitstring'), nchar(b))
  expect_equal(nelems("hello", 'chr'), 5)

})
