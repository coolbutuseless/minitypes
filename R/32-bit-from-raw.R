
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
raw_to_int32 <- function(raw_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_raw_vec(raw_vec))
  endian <- match.arg(endian)

  if (length(raw_vec) %% 4L != 0L) {
    stop("raw_to_int32(): Length of 'raw_vec' must be a multiple of 4.")
  }

  readBin(raw_vec, what = 'int', n = length(raw_vec)/4L, size = 4L, signed = TRUE, endian = endian)
}
