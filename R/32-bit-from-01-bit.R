
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
bit_to_int32 <- function(bit_vec, endian = c('little', 'big'),
                         first_bit = c('msb', 'lsb'), pad = c('right', 'left'), ...) {

  stopifnot(is_bit_vec(bit_vec))
  first_bit <- match.arg(first_bit)
  endian    <- match.arg(endian)
  pad       <- match.arg(pad)

  logical_vec <- bit_to_logical(bit_vec)
  logical_to_int32(logical_vec, endian = endian, first_bit = first_bit, pad = pad)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
bitstring_to_int32 <- function(bitstring, endian = c('little', 'big'),
                               first_bit = c('msb', 'lsb'), pad = c('right', 'left'), ...) {
  stopifnot(is_bitstring(bitstring))
  endian    <- match.arg(endian)
  first_bit <- match.arg(first_bit)
  pad       <- match.arg(pad)

  logical_vec <- bitstring_to_logical(bitstring)
  logical_to_int32(logical_vec, endian = endian, first_bit = first_bit, pad = pad)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
logical_to_int32 <- function(logical_vec, endian = c('little', 'big'),
                             first_bit = c('msb', 'lsb'), pad = c('right', 'left'), ...) {
  stopifnot(is_logical_vec(logical_vec))
  endian    <- match.arg(endian)
  first_bit <- match.arg(first_bit)
  pad       <- match.arg(pad)

  logical_vec <- pad_logical_vec(logical_vec, multiple = 32L, pad = pad)
  raw_vec     <- logical_to_raw(logical_vec, first_bit = first_bit, pad = pad)

  raw_to_int32(raw_vec, endian = endian)
}
