# smudge

## Overview
smudge provides a consistent set of vectorised verbs to remove the following personal data from text:
- emails  
- names  
- dates  
- phone numbers  
- street addresses  
- zip codes (US)  
- postcodes (UK)  
- all of the above  

## Usage
All functions in smudge start with `smudge_` and take a vector of strings as the first argument. By default, identified personal data will be replaced with `NA`:


If you wish to drop any identified personal data, the second argument to all smudge functions, `replace_na`, can be set to `FALSE`:

Combine with your favourite dplyr verbs to easily remove personal data from data frames:

## Limitations
Smudge is not designed to replace responsible management of personal data. Rather, it is a quick and dirty method for quickly removing personal data from text. Under the hood it uses a combination of regular expressions and lookup tables.

## Getting help
If you encounter a clear bug, please file a minimal reproducible example
in [issues](https://github.com/MikeJohnPage/smudge/issues).
