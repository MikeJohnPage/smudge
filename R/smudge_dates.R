smudge_dates <- function(vec, replace_with_na = TRUE){

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_na))

  # Remove dates else replace with NA
  if(replace_with_na == TRUE){
    vec[grepl(pattern = "[0-9]{2}(/|-|.)[0-9]{2}(/|-|.)[0-9]{2,4}",
              x = vec)] = NA
  } else{
    vec <- vec[!grepl(pattern = "[0-9]{2}(/|-|.)[0-9]{2}(/|-|.)[0-9]{2,4}",
                      x = vec)]
  }

  return(vec)

}
