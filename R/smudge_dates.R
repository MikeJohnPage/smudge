#' Smudge dates
#'
#' \code{smudge_dates} removes dates from text data.
#'
#' @param vec Character vector.
#' @param replace_with_na Logical, indicating whether dates should be be
#'   replaced with NA or dropped.
#'
#' @return
#' @export
#'
#' @seealso Other verbs to smudge personal data: \code{\link{smudge_addresses}}
#'   \code{\link{smudge_all}} \code{\link{smudge_emails}}
#'   \code{\link{smudge_names}} \code{\link{smudge_numbers}}
#'   \code{\link{smudge_postcodes}}
#'
#' @examples
#' vec <- c("20-10-10", "03/06/1992", "hello world")
#' smudge_dates(vec)
#' smudge_dates(vec, replace_with_na = FALSE)
smudge_dates <- function(vec, replace_with_na = TRUE) {

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_with_na))

  # Remove dates else replace with NA
  if (replace_with_na == TRUE) {
    vec[grepl(
      pattern = "[0-9]{2}(/|-|.)[0-9]{2}(/|-|.)[0-9]{2,4}",
      x = vec
    )] <- NA
  } else {
    vec <- vec[!grepl(
      pattern = "[0-9]{2}(/|-|.)[0-9]{2}(/|-|.)[0-9]{2,4}",
      x = vec
    )]
  }

  return(vec)
}
