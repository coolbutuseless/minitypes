
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Swap endianness in a raw vector
#'
#' @param raw_vec initial raw vector
#' @param nbytes number of bytes to consider for each swap. usually 2, 4, or 8
#'
#' @return raw vector with swapped endianness
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
raw_swap_endian <- function(raw_vec, nbytes) {
  stopifnot(is_raw_vec(raw_vec))

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Initial vector needs to be a multiple of the swapping size
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  N <- length(raw_vec)
  stopifnot(N >= nbytes)
  stopifnot(N > 0L)
  stopifnot(N %% nbytes == 0L)

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # initialise an output vector
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  swapped_vec <- raw(N)

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # R loop to swap bytes
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  for (ii in seq.int(nbytes)) {
    swapped_vec[seq(ii, N, nbytes)] <- raw_vec[seq(nbytes - ii + 1L, N, nbytes)]
  }

  swapped_vec
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Swap endianness in a uint16 vector
#'
#' @param uint16_vec initial uint16 vector
#'
#' @return uint16 vector with swapped endianness
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uint16_swap_endian <- function(uint16_vec) {
  stopifnot(is_uint16_vec(uint16_vec))

  raw_vec <- uint16_to_raw(uint16_vec, endian = 'little')
  raw_to_uint16(raw_vec, endian = 'big')
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Swap endianness in a int32 vector
#'
#' @param int32_vec initial int32 vector
#'
#' @return int32 vector with swapped endianness
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
int32_swap_endian <- function(int32_vec) {
  stopifnot(is_int32_vec(int32_vec))

  raw_vec <- int32_to_raw(int32_vec, endian = 'little')
  raw_to_int32(raw_vec, endian = 'big')
}
