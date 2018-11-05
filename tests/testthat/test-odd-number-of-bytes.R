context("odd-number-of-bytes")

test_that("odd-number-of-bytes works", {

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # 5 bytes
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  raw_vec  <- as.raw(c(1:4, 254))
  bit_vec  <- raw_to_bit(raw_vec)
  transfer <- bit_to_raw(bit_vec)

  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # 3 bytes
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  raw_vec  <- as.raw(c(1:3))
  bit_vec  <- raw_to_bit(raw_vec)
  transfer <- bit_to_raw(bit_vec)

  expect_identical(raw_vec, transfer)

})
