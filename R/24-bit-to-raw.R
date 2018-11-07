
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uint24_to_raw <- function(uint24_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_uint24_vec(uint24_vec))
  endian <- match.arg(endian)

  # Can't do 'size = 3'
  # writeBin(uint24_vec, raw(), size = 3L, useBytes = TRUE, endian = endian)

  # so instead, treat as 32 bit, and drop every 4th byte from the raw vec
  raw_vec <- int32_to_raw(uint24_vec, endian = endian)
  if (length(raw_vec) > 0) {
    if (endian == 'big') {
      raw_vec <- raw_vec[-seq(1L, length(raw_vec), 4L)]
    } else {
      raw_vec <- raw_vec[-seq(4L, length(raw_vec), 4L)]
    }
  }

  raw_vec
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
