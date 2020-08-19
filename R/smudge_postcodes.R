#' Smudge UK postcodes
#'
#' \code{smudge_postcodes} removes UK postcodes from text data.
#'
#' @param vec Character vector.
#' @param replace_with_na Logical, indicating whether UK postcodes should be be
#'   replaced with NA or dropped.
#'
#' @return
#' @export
#'
#' @seealso Other verbs to smudge personal data: \code{\link{smudge_addresses}}
#'   \code{\link{smudge_all}} \code{\link{smudge_dates}}
#'   \code{\link{smudge_emails}} \code{\link{smudge_names}}
#'   \code{\link{smudge_numbers}}
#'
#' @examples
#' vec <- c("SW1P 4DF", "hello world")
#' smudge_postcodes(vec)
#' smudge_postcodes(vec, replace_with_na = FALSE)
smudge_postcodes <- function(vec, replace_with_na = TRUE) {

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_with_na))

  # Remove postcodes else replace with NA
  if (replace_with_na == TRUE) {
    vec[grepl(
      pattern = "([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\\s?[0-9][A-Za-z]{2})",
      x = vec,
      perl = TRUE
    )] <- NA
  } else {
    vec <- vec[!grepl(
      pattern = "([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\\s?[0-9][A-Za-z]{2})",
      x = vec,
      perl = TRUE
    )]
  }

  return(vec)
}
