context("test-uint24")

test_that("uint24 to raw and back works", {

  # int24 is tricky as 'readBin' does not accept a 'size = 3L' argumnet
  # (only 1, 2 and 4)


  raw_vec <- as.raw(1:3)

  uint24_vec <- raw_to_uint24(raw_vec, endian = 'little')
  expect_identical(uint24_vec, 3L*256L*256L + 2L * 256L + 1L)

  raw_vec2 <- uint24_to_raw(uint24_vec, endian = 'little')
  expect_identical(raw_vec, raw_vec2)

  uint24_vec <- raw_to_uint24(raw_vec, endian = 'big')
  expect_identical(uint24_vec, 1L*256L*256L + 2L * 256L + 3L)

  raw_vec2 <- uint24_to_raw(uint24_vec, endian = 'big')
  expect_identical(raw_vec, raw_vec2)


  expect_identical(convert_type(uint24_vec, 'uint24', 'uint8', endian = 'big'   ), 1:3)
  expect_identical(convert_type(uint24_vec, 'uint24', 'uint8', endian = 'little'), 3:1)

  expect_identical(convert_type(uint24_vec, 'uint24', 'hex24'), '010203')

})
