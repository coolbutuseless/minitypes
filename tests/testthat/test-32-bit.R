context("int32")

test_that("int32_to_bit works", {
  one <- 1L  # 00000000 00000000 00000000 00000001

  expect_identical(int32_to_bitstring(one, endian = 'little', first_bit = 'lsb'), minitypes:::tidy_bitstring("10000000 00000000 00000000 00000000"))
  expect_identical(int32_to_bitstring(one, endian = 'little', first_bit = 'msb'), minitypes:::tidy_bitstring("00000001 00000000 00000000 00000000"))
  expect_identical(int32_to_bitstring(one, endian = 'big'   , first_bit = 'lsb'), minitypes:::tidy_bitstring("00000000 00000000 00000000 10000000"))
  expect_identical(int32_to_bitstring(one, endian = 'big'   , first_bit = 'msb'), minitypes:::tidy_bitstring("00000000 00000000 00000000 00000001"))


  big_1    <- raw_to_int32(as.raw(c(1, 0, 0, 0)), endian = 'big') # 2 ^ 24

  expect_identical(int32_to_bitstring(big_1, endian = 'little', first_bit = 'lsb'), minitypes:::tidy_bitstring("00000000 00000000 00000000 10000000"))
  expect_identical(int32_to_bitstring(big_1, endian = 'little', first_bit = 'msb'), minitypes:::tidy_bitstring("00000000 00000000 00000000 00000001"))
  expect_identical(int32_to_bitstring(big_1, endian = 'big'   , first_bit = 'lsb'), minitypes:::tidy_bitstring("10000000 00000000 00000000 00000000"))
  expect_identical(int32_to_bitstring(big_1, endian = 'big'   , first_bit = 'msb'), minitypes:::tidy_bitstring("00000001 00000000 00000000 00000000"))
})



test_that("logical_to_int32 works", {
  little_1 <- 1L
  big_1    <- raw_to_int32(as.raw(c(1, 0, 0, 0)), endian = 'big')

  expect_identical(logical_to_int32(bitstring_to_logical("10000000 00000000 00000000 00000000"), endian='little', 'lsb'), little_1)
  expect_identical(logical_to_int32(bitstring_to_logical("00000000 00000000 00000000 00000001"), endian='little', 'msb'), big_1   )
  expect_identical(logical_to_int32(bitstring_to_logical("10000000 00000000 00000000 00000000"), endian='big'   , 'lsb'), big_1   )
  expect_identical(logical_to_int32(bitstring_to_logical("00000000 00000000 00000000 00000001"), endian='big'   , 'msb'), little_1)
})



test_that("bit_to_int32 works", {
  little_1 <- 1L
  big_1    <- raw_to_int32(as.raw(c(1, 0, 0, 0)), endian = 'big')

  expect_identical(bit_to_int32(bitstring_to_bit("10000000 00000000 00000000 00000000"), endian='little', 'lsb'), little_1)
  expect_identical(bit_to_int32(bitstring_to_bit("00000000 00000000 00000000 00000001"), endian='little', 'msb'), big_1   )
  expect_identical(bit_to_int32(bitstring_to_bit("10000000 00000000 00000000 00000000"), endian='big'   , 'lsb'), big_1   )
  expect_identical(bit_to_int32(bitstring_to_bit("00000000 00000000 00000000 00000001"), endian='big'   , 'msb'), little_1)
})



test_that("bitstring_to_int32 works", {
  little_1 <- 1L
  big_1    <- raw_to_int32(as.raw(c(1, 0, 0, 0)), endian = 'big')

  expect_identical(bitstring_to_int32("10000000 00000000 00000000 00000000", endian='little', 'lsb'), little_1)
  expect_identical(bitstring_to_int32("00000000 00000000 00000000 00000001", endian='little', 'msb'), big_1   )
  expect_identical(bitstring_to_int32("10000000 00000000 00000000 00000000", endian='big'   , 'lsb'), big_1   )
  expect_identical(bitstring_to_int32("00000000 00000000 00000000 00000001", endian='big'   , 'msb'), little_1)
})