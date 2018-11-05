
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Check if values are of the requested type
#'
#' @param x vector of values to test
#'
#' @return single boolean
#'
#' @importFrom bit is.bit
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
is_raw_vec <- function(x) {
  is.raw(x)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Convert the given type to a raw vector
#'
#' @param raw_vec vector of raw bytes
#' @param bit_vec,bitstring,logical_vec vector of bit/logical type
#' @param uint8_vec,uint16_vec,uint24_vec vector of unsigned integer type
#' @param int8_vec,int16_vec,int32_vec vector of signed integer type
#' @param hex8_vec,hex16_vec,hex24_vec vector of hex representation type
#' @param chr_vec,utf8_vec vector of character type
#' @param endian 'little' or 'big'. default: 'little'
#' @param first_bit 'msb' or 'lsb'. default: 'msb'
#' @param pad 'left' or 'right'. default: 'right'
#' @param ... extra args passed through to core functions
#'
#' @import bit
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
raw_to_raw <- function(raw_vec, ...) {
  raw_vec
}
