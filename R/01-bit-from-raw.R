
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
raw_to_bit <- function(raw_vec, first_bit = c('msb', 'lsb'), ...) {
  stopifnot(is_raw_vec(raw_vec))
  first_bit <- match.arg(first_bit)

  logical_to_bit(raw_to_logical(raw_vec, first_bit = first_bit, ...))
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
raw_to_logical <- function(raw_vec, first_bit = c('msb', 'lsb'), ...) {
  stopifnot(is_raw_vec(raw_vec))
  first_bit <- match.arg(first_bit)

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # if first_bit = 'msb'
  #    - reverse bits in the raw vector first, because `rawToBits` always
  #      does 'lsb' first
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  if (first_bit == 'msb') {
    raw_vec <- raw_reverse_bits(raw_vec)
  }

  as.logical(rawToBits(raw_vec))
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
raw_to_bitstring <- function(raw_vec, first_bit = c('msb', 'lsb'), ...) {
  stopifnot(is_raw_vec(raw_vec))
  first_bit <- match.arg(first_bit)

  logical_to_bitstring(raw_to_logical(raw_vec, first_bit = first_bit, ...))
}
