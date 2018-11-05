

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Get the length of a vector of the given type
#'
#' @param vec vector of values
#' @param type type of values
#'
#' @return Number of elements in the vector
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
vec_length <- function(vec, type) {
  if (type %in% c('utf8', 'chr', 'bitstring')) {
    nchar(vec)
  } else {
    length(vec)
  }
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Relative sizes of types compared to 'raw'
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
relative_size <- c(
  raw       = 1,
  uint8     = 1,
  uint16    = 2,
  uint24    = 3,
  int8      = 1,
  int16     = 2,
  int24     = 3,
  int32     = 4,
  hex8      = 1,
  hex16     = 2,
  hex24     = 3,
  utf8      = 1,
  chr       = 1,
  bit       = 1/8,
  logical   = 1/8,
  bitstring = 1/8
)



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Get the number of bytes in a vector of the given type
#'
#' @param vec vector of values
#' @param type type of values
#'
#' @return Number of bytes in the vector
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nbytes <- function(vec, type) {
  vec_length(vec, type) * relative_size[[type]]
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Tidy bitstring e.g. remove spaces
#'
#' @param bitstring bitstring
#' @return bitstring with spaces removed
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tidy_bitstring <- function(bitstring) {
  gsub("\\s", "", bitstring)
}