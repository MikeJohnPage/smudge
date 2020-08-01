smudge_names <- function(vec, replace_na = TRUE){

  # Check vec is of type character
  stopifnot(is.character(vec))

  # Check replace is of type logical
  stopifnot(is.logical(replace_na))

  # Load list of names
  names <- readRDS("data/names.rds")

  # Remove names else replace with NA
  if(replace_na == TRUE){
    vec[vec %in% names] = NA
  } else {
    vec[!(vec %in% names)]
  }

  # Return vec
  return(vec)

}

