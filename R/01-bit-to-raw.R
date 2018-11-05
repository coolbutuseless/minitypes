
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
bit_to_raw <- function(bit_vec, first_bit = c('msb', 'lsb'), pad = c('right', 'left'), ...) {
  stopifnot(is_bit_vec(bit_vec))

  logical_to_raw(bit_to_logical(bit_vec), first_bit = first_bit, pad = pad, ...)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
logical_to_raw <- function(logical_vec, first_bit = c('msb', 'lsb'), pad = c('right', 'left'), ...) {
  stopifnot(is_logical_vec(logical_vec))
  first_bit <- match.arg(first_bit)
  pad       <- match.arg(pad)

  if (length(logical_vec) %% 8L != 0L) {
    message("logical_to_raw(): padding logical_vec length to a multiple of 8.")
    logical_vec <- pad_logical_vec(logical_vec, pad = pad)
  }

  res <- packBits(logical_vec, type = 'raw')

  if (first_bit == 'msb') {
    res <- raw_reverse_bits(res)
  }

  res
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
bitstring_to_raw <- function(bitstring, first_bit = c('msb', 'lsb'), pad = c('right', 'left'), ...) {
  logical_to_raw(bitstring_to_logical(bitstring), first_bit = first_bit, pad = pad, ...)
}
