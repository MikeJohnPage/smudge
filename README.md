# smudge

## Overview
smudge provides a consistent set of verbs to remove the following personal data from text:
- emails  
- names  
- dates  
- phone numbers  
- street addresses  
- zip codes (US)  
- postcodes (UK)  
- all of the above  

## Usage
All functions in smudge start with `smudge_` and take a vector of strings as the first argument.

## Limitations
Smudge is not designed to replace responsible management of personal data. Rather, it is a quick and dirty method for quickly removing personal data from text. Under the hood it uses a combination of regular expressions and lookup tables.

## Getting help
If you encounter a clear bug, please file a minimal reproducible example
in [issues](https://github.com/MikeJohnPage/smudge/issues).
