context("test-uint16-swap-endian")

test_that("uint16-swap-endian works", {

  uint8_vec  <- 1:4
  uint16_vec <- convert_type(uint8_vec, 'uint8', 'uint16', endian = 'little')
  expect_identical(uint16_vec, c(513L, 1027L))


  uint16_s_vec_ref <- convert_type(uint8_vec, 'uint8', 'uint16', endian = 'big')
  expect_identical(uint16_s_vec_ref, c(258L, 772L))


  uint16_s_vec <- uint16_swap_endian(uint16_vec)

  expect_identical(uint16_s_vec, uint16_s_vec_ref)

})
