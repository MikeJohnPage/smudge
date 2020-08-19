#' Smudge addresses
#'
#' \code{smudge_addresses} removes addresses from text data.
#'
#' @param vec Character vector.
#' @param replace_with_na Logical, indicating whether addresses should be be
#'   replaced with NA or dropped.
#'
#' @return
#' @export
#'
#' @seealso Other verbs to smudge personal data: \code{\link{smudge_all}}
#'   \code{\link{smudge_dates}} \code{\link{smudge_emails}}
#'   \code{\link{smudge_names}} \code{\link{smudge_numbers}}
#'   \code{\link{smudge_postcodes}}
#'
#' @examples
#' vec <- c("Imaginary Drive", "Fake Ave", "hello world")
#' smudge_addresses(vec)
#' smudge_addresses(vec, replace_with_na = FALSE)
smudge_addresses <- function(vec, replace_with_na = TRUE) {

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_with_na))

  # Remove addresses else replace with NA
  if (replace_with_na == TRUE) {
    vec[grepl(
      pattern = "(?:[A-Za-z0-9.-]+[ ]?)+(?:Avenue|Lane|Road|Boulevard|Drive|Street|Ave|Dr|Rd|Blvd|Ln|St)\\.?",
      x = vec,
      perl = TRUE
    )] <- NA
  } else {
    vec <- vec[!grepl(
      pattern = "(?:[A-Za-z0-9.-]+[ ]?)+(?:Avenue|Lane|Road|Boulevard|Drive|Street|Ave|Dr|Rd|Blvd|Ln|St)\\.?",
      x = vec,
      perl = TRUE
    )]
  }

  return(vec)
}
