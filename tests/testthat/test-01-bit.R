context("test-bit")

test_that("bit conversions works", {
  bit_vec     <- bit::as.bit(c(T, T, T, F, T, F, F, F, F))
  bitstring   <- '111010000'
  logical_vec <- c(T, T, T, F, T, F, F, F, F)


  expect_identical(bit_to_bitstring(bit_vec), bitstring  )
  expect_identical(bit_to_logical  (bit_vec), logical_vec)

  expect_identical(bitstring_to_bit    (bitstring), bit_vec    )
  expect_identical(bitstring_to_logical(bitstring), logical_vec)

  expect_identical(logical_to_bit      (logical_vec), bit_vec  )
  expect_identical(logical_to_bitstring(logical_vec), bitstring)
})


# Zero length bit representations are not supported
test_that("bit types must contain at least 1 element", {

  bit_vec     <- bit::bit(0)
  bitstring   <- ''
  logical_vec <- logical(0)

  expect_true(is_bit_vec(bit_vec))
  expect_true(is_bitstring(bitstring))
  expect_true(is_logical_vec(logical_vec))

  expect_identical(bit_to_bitstring(bit_vec), bitstring  )
  expect_identical(bit_to_logical  (bit_vec), logical_vec)

  expect_identical(bitstring_to_bit    (bitstring), bit_vec    )
  expect_identical(bitstring_to_logical(bitstring), logical_vec)

  expect_identical(logical_to_bit      (logical_vec), bit_vec  )
  expect_identical(logical_to_bitstring(logical_vec), bitstring)

})




test_that("logical-to-raw padding works", {

  logical_vec <- TRUE
  suppressMessages({
    expect_equal(logical_to_raw(logical_vec), as.raw(128))
  })

  logical_vec <- TRUE
  suppressMessages({
    expect_equal(logical_to_raw(logical_vec, pad = 'left'), as.raw(1))
  })

})



test_that("identidy type conversion returns same object", {

  uint8_vec <- 1:4
  raw_vec   <- convert_type(uint8_vec, 'uint8', 'raw')
  expect_identical(uint8_vec, convert_type(uint8_vec, 'uint8' , 'uint8' ))
  expect_identical(uint8_vec, convert_type(uint8_vec, 'uint32', 'uint32'))
  expect_identical(raw_vec  , convert_type(raw_vec, 'raw'   , 'raw'))

})