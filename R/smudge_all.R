#' Smudge all
#'
#' \code{smudge_all} removes addresses, dates, emails, names, phone numbers and
#' UK postcodes from text data.
#'
#' @param vec Character vector.
#' @param replace_with_na Logical, indicating whether personal data should be be
#'   replaced with NA or dropped.
#'
#' @return
#' @export
#'
#' @seealso Other verbs to smudge personal data: \code{\link{smudge_addresses}}
#'   \code{\link{smudge_dates}} \code{\link{smudge_emails}}
#'   \code{\link{smudge_names}} \code{\link{smudge_numbers}}
#'   \code{\link{smudge_postcodes}}
#'
#' @examples
#' vec <- c("Fake Ave", "Hadley", "rdev@@fakemail.com", "hello world")
#' smudge_all(vec)
#' smudge_all(vec, replace_with_na = FALSE)
smudge_all <- function(vec, replace_with_na = TRUE) {

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_with_na))

  # Load list of names
  names <- readRDS("data/names.rds")

  # Concatenate cases
  names <- c(names, tolower(names), toupper(names))

  # Remove all personal data else replace with NA
  if (replace_with_na == TRUE) {

    # Names
    vec[vec %in% names] <- NA

    # Postcodes
    vec[grepl(
      pattern = "([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\\s?[0-9][A-Za-z]{2})",
      x = vec,
      perl = TRUE
    )] <- NA

    # Emails
    vec[grepl(
      pattern = "(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$)",
      x = vec,
      perl = TRUE
    )] <- NA

    # Addresses
    vec[grepl(
      pattern = "(?:[A-Za-z0-9.-]+[ ]?)+(?:Avenue|Lane|Road|Boulevard|Drive|Street|Ave|Dr|Rd|Blvd|Ln|St)\\.?",
      x = vec,
      perl = TRUE
    )] <- NA

    # Dates
    vec[grepl(
      pattern = "[0-9]{2}(/|-|.)[0-9]{2}(/|-|.)[0-9]{2,4}",
      x = vec
    )] <- NA

    # Numbers
    vec[grepl(
      pattern = "^(?:(?:\\(?(?:0(?:0|11)\\)?[\\s-]?\\(?|\\+)44\\)?[\\s-]?(?:\\(?0\\)?[\\s-]?)?)|(?:\\(?0))(?:(?:\\d{5}\\)?[\\s-]?\\d{4,5})|(?:\\d{4}\\)?[\\s-]?(?:\\d{5}|\\d{3}[\\s-]?\\d{3}))|(?:\\d{3}\\)?[\\s-]?\\d{3}[\\s-]?\\d{3,4})|(?:\\d{2}\\)?[\\s-]?\\d{4}[\\s-]?\\d{4}))(?:[\\s-]?(?:x|ext\\.?|\\#)\\d{3,4})?$",
      x = vec
    )] <- NA
  } else {

    # Names
    vec <- vec[!(vec %in% names)]

    # Postcodes
    vec <- vec[!grepl(
      pattern = "([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\\s?[0-9][A-Za-z]{2})",
      x = vec,
      perl = TRUE
    )]

    # Emails
    vec <- vec[!grepl(
      pattern = "(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$)",
      x = vec,
      perl = TRUE
    )]

    # Addresses
    vec <- vec[!grepl(
      pattern = "(?:[A-Za-z0-9.-]+[ ]?)+(?:Avenue|Lane|Road|Boulevard|Drive|Street|Ave|Dr|Rd|Blvd|Ln|St)\\.?",
      x = vec,
      perl = TRUE
    )]

    # Dates
    vec <- vec[!grepl(
      pattern = "[0-9]{2}(/|-|.)[0-9]{2}(/|-|.)[0-9]{2,4}",
      x = vec
    )]

    # Numbers
    vec <- vec[!grepl(
      pattern = "^(?:(?:\\(?(?:0(?:0|11)\\)?[\\s-]?\\(?|\\+)44\\)?[\\s-]?(?:\\(?0\\)?[\\s-]?)?)|(?:\\(?0))(?:(?:\\d{5}\\)?[\\s-]?\\d{4,5})|(?:\\d{4}\\)?[\\s-]?(?:\\d{5}|\\d{3}[\\s-]?\\d{3}))|(?:\\d{3}\\)?[\\s-]?\\d{3}[\\s-]?\\d{3,4})|(?:\\d{2}\\)?[\\s-]?\\d{4}[\\s-]?\\d{4}))(?:[\\s-]?(?:x|ext\\.?|\\#)\\d{3,4})?$",
      x = vec
    )]
  }

  # Return vec
  return(vec)
}
