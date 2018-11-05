
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
raw_to_uint24 <- function(raw_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_raw_vec(raw_vec))
  endian <- match.arg(endian)

  if (length(raw_vec) %% 3L != 0L) {
    stop("raw_to_uint24(): Length of 'raw_vec' must be a multiple of 3.")
  }

  n         <- length(raw_vec)
  int24_vec <- integer(n/3L)

  uint8_vec <- raw_to_uint8(raw_vec)

  if (endian == 'little') {
    int24_vec <-
      uint8_vec[seq(1L, n, 3L)] * 1L +
      uint8_vec[seq(2L, n, 3L)] * 256L +
      uint8_vec[seq(3L, n, 3L)] * 65536L
  } else {
    int24_vec <-
      uint8_vec[seq(1L, n, 3L)] * 65536L +
      uint8_vec[seq(2L, n, 3L)] * 256L +
      uint8_vec[seq(3L, n, 3L)] * 1L
  }

  # readBin does not work with size = 3
  # readBin(raw_vec, what = 'int', n = length(raw_vec)/3L, size = 3L, signed = FALSE, endian = endian)

  int24_vec
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
raw_to_hex24 <- function(raw_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_raw_vec(raw_vec))
  endian <- match.arg(endian)

  if (length(raw_vec) %% 3L != 0L) {
    stop("raw_to_hex24(): Length of 'raw_vec' must be a multiple of 3.")
  }

  uint24_vec <- raw_to_uint24(raw_vec, endian = endian)
  format(as.hexmode(uint24_vec), width = 6L)
}
