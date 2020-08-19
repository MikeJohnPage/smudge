smudge_names <- function(vec, replace_with_na = TRUE){

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_with_na))

  # Load list of names
  names <- readRDS("data/names.rds")

  # Concatenate cases
  names <- c(names, tolower(names), toupper(names))

  # Remove names else replace with NA
  if(replace_with_na == TRUE){
    vec[vec %in% names] = NA
  } else {
    vec <- vec[!(vec %in% names)]
  }

  # Return vec
  return(vec)

}
