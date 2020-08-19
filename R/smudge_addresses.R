smudge_addresses <- function(vec, replace_with_na = TRUE){

  # Check arg types
  stopifnot(is.character(vec))
  stopifnot(is.logical(replace_with_na))

  # Remove addresses else replace with NA
  if(replace_with_na == TRUE){
    vec[grepl(pattern = "(?:[A-Za-z0-9.-]+[ ]?)+(?:Avenue|Lane|Road|Boulevard|Drive|Street|Ave|Dr|Rd|Blvd|Ln|St)\\.?",
              x = vec,
              perl = TRUE)] = NA
  } else{
    vec <- vec[!grepl(pattern = "(?:[A-Za-z0-9.-]+[ ]?)+(?:Avenue|Lane|Road|Boulevard|Drive|Street|Ave|Dr|Rd|Blvd|Ln|St)\\.?",
                      x = vec,
                      perl = TRUE)]
  }

  return(vec)

}
