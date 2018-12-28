context("test-vec-length")

test_that("nbytes works", {
  expect_identical(nbytes("hello"       , "chr"      ), 5)
  expect_identical(nbytes(1:4           , "int32"    ), 16)
  expect_identical(nbytes("00110011"    , "bitstring"), 1)
  expect_identical(nbytes("001100110011", "bitstring"), 1.5)
})

