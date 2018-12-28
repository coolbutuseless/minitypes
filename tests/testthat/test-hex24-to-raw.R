context("test-hex24-to-raw")

test_that("hex24-to-raw works", {
  uint8_vec <- 1:3
  uint24_vec <- convert_type(uint8_vec, 'uint8', 'uint24')
  hex24_vec  <- convert_type(uint8_vec, 'uint8', 'hex24' )

  raw_vec1 <- convert_type(uint24_vec, 'uint24', 'raw')
  raw_vec2 <- convert_type(hex24_vec , 'hex24' , 'raw')


  expect_identical(raw_vec1, as.raw(1:3))
  expect_identical(raw_vec2, as.raw(1:3))

})
