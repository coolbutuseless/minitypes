context("raw")


# This test converts raw to every possible type and then back again.
# it checks the initial raw vector matches the final raw vector ad
# that the converted result is as expected

test_that("raw-to-x x-to-raw works", {
  raw_vec <- as.raw(1:4)
  # raw_vec <- as.raw(65:68)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # uint8
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_uint8(raw_vec)
  transfer     <- uint8_to_raw(intermediate)
  expect_identical(intermediate, 1:4)
  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # uint16
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_uint16(raw_vec)
  transfer     <- uint16_to_raw(intermediate)
  expect_identical(intermediate, c(513L, 1027L))
  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # int8
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_int8(raw_vec)
  transfer     <- int8_to_raw(intermediate)
  expect_identical(intermediate, 1:4)
  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # int16
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_int16(raw_vec)
  transfer     <- int16_to_raw(intermediate)
  expect_identical(intermediate, c(513L, 1027L))
  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # int32
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_int32(raw_vec)
  transfer     <- int32_to_raw(intermediate)
  expect_identical(intermediate, 67305985L)
  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # hex8
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_hex8(raw_vec)
  transfer     <- hex8_to_raw(intermediate)
  expect_identical(intermediate, c('01', '02', '03', '04'))
  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # hex16
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_hex16(raw_vec)
  transfer     <- hex16_to_raw(intermediate)
  expect_identical(intermediate, c('0201', '0403'))
  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # chr
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_chr(raw_vec)
  transfer     <- chr_to_raw(intermediate)
  expect_identical(intermediate, "\001\002\003\004")
  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # utf8
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_utf8(raw_vec)
  transfer     <- utf8_to_raw(intermediate)
  expect_identical(intermediate, "\001\002\003\004")
  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # bit
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_bit(raw_vec)
  transfer     <- bit_to_raw(intermediate)
  expect_identical(intermediate, bit::as.bit(c(
    F, F, F, F,  F, F, F, T,
    F, F, F, F,  F, F, T, F,
    F, F, F, F,  F, F, T, T,
    F, F, F, F,  F, T, F, F
  )))
  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # logical
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_logical(raw_vec)
  transfer     <- logical_to_raw(intermediate)
  expect_identical(intermediate, c(
    F, F, F, F,  F, F, F, T,
    F, F, F, F,  F, F, T, F,
    F, F, F, F,  F, F, T, T,
    F, F, F, F,  F, T, F, F
  ))
  expect_identical(raw_vec, transfer)


  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # bitstring
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  intermediate <- raw_to_bitstring(raw_vec)
  transfer     <- bitstring_to_raw(intermediate)
  expect_identical(intermediate, paste(as.integer(c(
    F, F, F, F,  F, F, F, T,
    F, F, F, F,  F, F, T, F,
    F, F, F, F,  F, F, T, T,
    F, F, F, F,  F, T, F, F
  )), collapse=''))
  expect_identical(raw_vec, transfer)

})
