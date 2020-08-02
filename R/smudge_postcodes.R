smudge_postcodes <- function(vec, replace_na = TRUE){

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_na))

  # Remove postcodes else replace with NA
  if(replace_na == TRUE){
    vec[grepl(pattern = "([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\\s?[0-9][A-Za-z]{2})",
              x = vec,
              perl = TRUE)] = NA
  } else{
    vec <- vec[!grepl(pattern = "([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\\s?[0-9][A-Za-z]{2})",
                      x = vec,
                      perl = TRUE)]
  }

  return(vec)

}