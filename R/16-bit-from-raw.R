
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
raw_to_uint16 <- function(raw_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_raw_vec(raw_vec))
  endian <- match.arg(endian)

  if (length(raw_vec) %% 2L != 0L) {
    stop("raw_to_uint16(): Length of 'raw_vec' must be a multiple of 2.")
  }

  readBin(raw_vec, what = 'int', n = length(raw_vec)/2L, size = 2L, signed = FALSE, endian = endian)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
raw_to_int16 <- function(raw_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_raw_vec(raw_vec))
  endian <- match.arg(endian)

  if (length(raw_vec) %% 2L != 0L) {
    stop("raw_to_int16(): Length of 'raw_vec' must be a multiple of 2.")
  }

  readBin(raw_vec, what = 'int', n = length(raw_vec)/2L, size = 2L, signed = TRUE, endian = endian)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
raw_to_hex16 <- function(raw_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_raw_vec(raw_vec))
  endian <- match.arg(endian)

  if (length(raw_vec) %% 2L != 0L) {
    stop("raw_to_hex16(): Length of 'raw_vec' must be a multiple of 2.")
  }

  uint16_vec <- raw_to_uint16(raw_vec, endian = endian)
  format(as.hexmode(uint16_vec), width = 4L)
}
