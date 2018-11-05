
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uint24_to_raw <- function(uint24_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_uint24_vec(uint24_vec))
  endian <- match.arg(endian)

  writeBin(uint24_vec, raw(), size = 3L, useBytes = TRUE, endian = endian)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hex24_to_raw <- function(hex24_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_hex24_vec(hex24_vec))
  endian <- match.arg(endian)

  uint24_vec <- strtoi(hex24_vec, base = 16L)
  uint24_to_raw(uint24_vec, endian)
}
