context("test-hex24")

test_that("hex24 works", {

  expect_error(convert_type(c(12L), 'uint8', 'hex24'), "multiple of 3")

  res <- convert_type(c(0L, 0L, 12L), 'uint8', 'hex24', endian = 'little')
  expect_identical(res, "0c0000")

  res <- convert_type(c(0L, 0L, 12L), 'uint8', 'hex24', endian = 'big')
  expect_identical(res, "00000c")

  expect_true(is_hex24_vec(res))

})
