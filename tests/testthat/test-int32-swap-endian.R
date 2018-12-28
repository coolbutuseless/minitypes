context("test-int32-swap-endian")

test_that("int32-swap-endian works", {

  uint8_vec  <- 1:4
  int32_vec <- convert_type(uint8_vec, 'uint8', 'int32', endian = 'little')
  expect_identical(int32_vec, 67305985L)


  int32_s_vec_ref <- convert_type(uint8_vec, 'uint8', 'int32', endian = 'big')
  expect_identical(int32_s_vec_ref, 16909060L)


  int32_s_vec <- int32_swap_endian(int32_vec)

  expect_identical(int32_s_vec, int32_s_vec_ref)
})
