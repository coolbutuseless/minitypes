
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Convert between any 2 supported types
#'
#' This converts types directly if available. Otherwise it converts from
#' one type to another by first converting to the built-in
#' 'raw' type and then converting from 'raw' to the destination
#' type
#'
#' @param src_vec source values
#' @param src_type source type
#' @param dst_type destination type
#' @param endian 'little' or 'big'. default: 'little'
#' @param first_bit 'msb' or 'lsb'. default: 'msb'
#' @param pad which side to add padding bits to make a full byte. 'right'
#'        or 'left'. default: 'right'
#' @param verbose default: FALSE
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
convert_type <- function(src_vec, src_type, dst_type,
                         endian    = c('little', 'big'),
                         first_bit = c('msb', 'lsb'),
                         pad       = c('right', 'left'),
                         verbose   = FALSE) {

  endian    <- match.arg(endian)
  first_bit <- match.arg(first_bit)
  pad       <- match.arg(pad)

  if (identical(src_type, dst_type)) {
    return(src_vec)
  }

  convert_func <- paste(src_type, 'to', dst_type, sep = '_')

  if (exists(convert_func)) {
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Direct conversion from source to dest type
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    if (verbose) {
      message("Direct conversion using: ", convert_func, "()")
    }
    do.call(convert_func, list(src_vec, endian = endian, first_bit = first_bit, pad = pad))
  } else {
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Convert from source-to-raw, then raw-to-destiation
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    convert_to_raw_func   <- paste(src_type, 'to', 'raw'   , sep = '_')
    convert_from_raw_func <- paste('raw'   , 'to', dst_type, sep = '_')

    raw_vec <- do.call(convert_to_raw_func  , list(src_vec, endian = endian, first_bit = first_bit, pad = pad))
    res_vec <- do.call(convert_from_raw_func, list(raw_vec, endian = endian, first_bit = first_bit, pad = pad))

    res_vec
  }
}
