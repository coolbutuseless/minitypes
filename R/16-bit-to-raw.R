
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uint16_to_raw <- function(uint16_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_uint16_vec(uint16_vec))
  endian <- match.arg(endian)

  writeBin(uint16_vec, raw(), size = 2L, useBytes = TRUE, endian = endian)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int16_to_raw <- function(int16_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_int16_vec(int16_vec))
  endian <- match.arg(endian)

  writeBin(int16_vec, raw(), size = 2L, useBytes = TRUE, endian = endian)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hex16_to_raw <- function(hex16_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_hex16_vec(hex16_vec))
  endian <- match.arg(endian)

  uint16_vec <- strtoi(hex16_vec, base = 16L)
  uint16_to_raw(uint16_vec, endian)
}
