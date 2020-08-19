#' Smudge numbers
#'
#' \code{smudge_numbers} removes phone numbers from text data.
#'
#' @param vec Character vector.
#' @param replace_with_na Logical, indicating whether phone numbers should be be
#'   replaced with NA or dropped.
#'
#' @return
#' @export
#'
#' @seealso Other verbs to smudge personal data: \code{\link{smudge_addresses}}
#'   \code{\link{smudge_all}} \code{\link{smudge_dates}}
#'   \code{\link{smudge_emails}} \code{\link{smudge_names}}
#'   \code{\link{smudge_postcodes}}
#'
#' @examples
#' vec <- c("01234567890", "hello world")
#' smudge_numbers(vec)
#' smudge_numbers(vec, replace_with_na = FALSE)
smudge_numbers <- function(vec, replace_with_na = TRUE) {

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_with_na))

  # Remove numbers else replace with NA
  if (replace_with_na == TRUE) {
    vec[grepl(
      pattern = "^(?:(?:\\(?(?:0(?:0|11)\\)?[\\s-]?\\(?|\\+)44\\)?[\\s-]?(?:\\(?0\\)?[\\s-]?)?)|(?:\\(?0))(?:(?:\\d{5}\\)?[\\s-]?\\d{4,5})|(?:\\d{4}\\)?[\\s-]?(?:\\d{5}|\\d{3}[\\s-]?\\d{3}))|(?:\\d{3}\\)?[\\s-]?\\d{3}[\\s-]?\\d{3,4})|(?:\\d{2}\\)?[\\s-]?\\d{4}[\\s-]?\\d{4}))(?:[\\s-]?(?:x|ext\\.?|\\#)\\d{3,4})?$",
      x = vec
    )] <- NA
  } else {
    vec <- vec[!grepl(
      pattern = "^(?:(?:\\(?(?:0(?:0|11)\\)?[\\s-]?\\(?|\\+)44\\)?[\\s-]?(?:\\(?0\\)?[\\s-]?)?)|(?:\\(?0))(?:(?:\\d{5}\\)?[\\s-]?\\d{4,5})|(?:\\d{4}\\)?[\\s-]?(?:\\d{5}|\\d{3}[\\s-]?\\d{3}))|(?:\\d{3}\\)?[\\s-]?\\d{3}[\\s-]?\\d{3,4})|(?:\\d{2}\\)?[\\s-]?\\d{4}[\\s-]?\\d{4}))(?:[\\s-]?(?:x|ext\\.?|\\#)\\d{3,4})?$",
      x = vec
    )]
  }

  return(vec)
}
