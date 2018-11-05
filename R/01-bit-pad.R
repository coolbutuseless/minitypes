
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Pad a bit vector so that its length is a multiple of the given value
#'
#' @param bit_vec vector of bit values
#' @param multiple bit length will be padded to be a multiple of this value. default: 8
#' @param pad place padding bits on the left or right. default: left
#' @param value value to pad with. TRUE or FALSE. default: FALSE
#'
#' @return padded bit vector
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pad_bit_vec <- function(bit_vec, multiple = 8L, pad = c('left', 'right'), value = FALSE) {
  stopifnot(is_bit_vec(bit_vec))

  n_partial <- length(bit_vec) %% multiple
  if (n_partial == 0L) {
    return(bit_vec)
  }

  n_extra_bits <- multiple - n_partial
  extra_bits   <- bit::bit(n_extra_bits)

  # Set bits to TRUE if value is not 0L
  if (isTRUE(value)) {
    extra_bits <- !extra_bits
  }

  # Create and return padded bit_vec
  pad <- match.arg(pad)
  if (pad == 'right') {
    c(bit_vec, extra_bits)
  } else {
    c(extra_bits, bit_vec)
  }
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Pad a logical vector so that its length is a multiple of the given value
#'
#' @param logical_vec vector of logical values
#' @param multiple vector length will be padded to be a multiple of this value. default: 8
#' @param pad place padding bits on the left or right. default: left
#' @param value value to pad with. TRUE or FALSE. default: FALSE
#'
#' @return padded logical vector
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pad_logical_vec <- function(logical_vec, multiple = 8L, pad = c('left', 'right'), value = FALSE) {
  stopifnot(is_logical_vec(logical_vec))

  n_partial <- length(logical_vec) %% multiple
  if (n_partial == 0L) {
    return(logical_vec)
  }

  n_extra_bits <- multiple - n_partial
  extra_bits   <- logical(n_extra_bits)

  # Set bits to TRUE if value is not 0L
  if (isTRUE(value)) {
    extra_bits <- !extra_bits
  }

  # Create and return padded logical_vec
  pad <- match.arg(pad)
  if (pad == 'right') {
    c(logical_vec, extra_bits)
  } else {
    c(extra_bits, logical_vec)
  }
}
