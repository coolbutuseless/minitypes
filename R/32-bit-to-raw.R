
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname raw_to_raw
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int32_to_raw <- function(int32_vec, endian = c('little', 'big'), ...) {
  stopifnot(is_int32_vec(int32_vec))
  endian <- match.arg(endian)

  writeBin(int32_vec, raw(), size = 4L, useBytes = TRUE, endian = endian)
}
