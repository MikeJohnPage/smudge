#' Smudge emails
#'
#' \code{smudge_emails} removes emails from text data.
#'
#' @param vec Character vector.
#' @param replace_with_na Logical, indicating whether emails should be be
#'   replaced with NA or dropped.
#'
#' @return
#' @export
#'
#' @seealso Other verbs to smudge personal data: \code{\link{smudge_addresses}}
#'   \code{\link{smudge_all}} \code{\link{smudge_dates}}
#'   \code{\link{smudge_names}} \code{\link{smudge_numbers}}
#'   \code{\link{smudge_postcodes}}
#'
#' @examples
#' vec <- c("rdev@@fakemail.com", "hello world")
#' smudge_emails(vec)
#' smudge_emails(vec, replace_with_na = FALSE)
smudge_emails <- function(vec, replace_with_na = TRUE) {

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_with_na))

  # Remove emails else replace with NA
  if (replace_with_na == TRUE) {
    vec[grepl(
      pattern = "(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$)",
      x = vec,
      perl = TRUE
    )] <- NA
  } else {
    vec <- vec[!grepl(
      pattern = "(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$)",
      x = vec,
      perl = TRUE
    )]
  }

  return(vec)
}
