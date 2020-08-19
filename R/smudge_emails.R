smudge_emails <- function(vec, replace_with_na = TRUE){

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_with_na))

  # Remove emails else replace with NA
  if(replace_with_na == TRUE){
    vec[grepl(pattern = "(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$)",
              x = vec,
              perl = TRUE)] = NA
  } else{
    vec <- vec[!grepl(pattern = "(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$)",
                      x = vec,
                      perl = TRUE)]
  }

  return(vec)

}
