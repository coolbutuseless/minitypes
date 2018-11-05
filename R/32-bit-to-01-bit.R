
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int32_to_bit <- function(int32_vec, endian = c('little', 'big'), first_bit = c('msb', 'lsb'), ...) {
  stopifnot(is_int32_vec(int32_vec))
  first_bit <- match.arg(first_bit)
  endian    <- match.arg(endian)

  logical_to_bit(int32_to_logical(int32_vec, endian = endian, first_bit = first_bit, ...))
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int32_to_bitstring <- function(int32_vec, endian = c('little', 'big'), first_bit = c('msb', 'lsb'), ...) {
  stopifnot(is_int32_vec(int32_vec))
  first_bit <- match.arg(first_bit)
  endian    <- match.arg(endian)

  logical_to_bitstring(int32_to_logical(int32_vec, endian = endian, first_bit = first_bit, ...))
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int32_to_logical <- function(int32_vec, endian = c('little', 'big'), first_bit = c('msb', 'lsb'), ...) {
  stopifnot(is_int32_vec(int32_vec))
  first_bit <- match.arg(first_bit)
  endian    <- match.arg(endian)

  raw_vec <- int32_to_raw(int32_vec, endian = endian)
  raw_to_logical(raw_vec, first_bit = first_bit)
}
