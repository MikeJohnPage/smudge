#' Smudge names
#'
#' \code{smudge_names} removes names from text data.
#'
#' @param vec Character vector.
#' @param replace_with_na Logical, indicating whether names should be be
#'   replaced with NA or dropped.
#'
#' @return
#' @export
#'
#' @seealso Other verbs to smudge personal data: \code{\link{smudge_addresses}}
#'   \code{\link{smudge_all}} \code{\link{smudge_dates}}
#'   \code{\link{smudge_emails}} \code{\link{smudge_numbers}}
#'   \code{\link{smudge_postcodes}}
#'
#' @examples
#' vec <- c("Hadley", "hello world")
#' smudge_names(vec)
#' smudge_names(vec, replace_with_na = FALSE)
smudge_names <- function(vec, replace_with_na = TRUE) {

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_with_na))

  # Load list of names
  names <- readRDS("data/names.rds")

  # Concatenate cases
  names <- c(names, tolower(names), toupper(names))

  # Remove names else replace with NA
  if (replace_with_na == TRUE) {
    vec[vec %in% names] <- NA
  } else {
    vec <- vec[!(vec %in% names)]
  }

  # Return vec
  return(vec)
}
