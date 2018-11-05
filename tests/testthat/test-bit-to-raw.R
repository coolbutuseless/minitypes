context("test-bit-to-raw")

test_that("bit_to_raw works", {

  bit_vec <- bit::as.bit(c(F, F, F, F,  F, F, F, T,
                           F, F, F, F,  F, F, T, F,
                           F, F, F, F,  F, T, F, F,
                           F, F, F, F,  T, F, F, F))

  expect_equal( bit_to_raw(bit_vec, first_bit = 'msb'),                   as.raw(c(1, 2, 4, 8)) )
  expect_equal( bit_to_raw(bit_vec, first_bit = 'lsb'),  raw_reverse_bits(as.raw(c(1, 2, 4, 8))) )

})
