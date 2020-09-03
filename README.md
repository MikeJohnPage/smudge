# smudge <img src='man/figures/smudge-logo.png' align="right" height="150" /></a>

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

## Overview
smudge personal data from your text, including:
- emails  
- names  
- dates  
- phone numbers  
- street addresses  
- UK postcodes

## Usage
All functions start with `smudge_` and take a vector of strings as the first argument. By default, personal data will be replaced with `NA`:

If instead you wish to drop personal data, the second argument to all smudge functions, `replace_with_na`, can be set to `FALSE`:

Combine with your favourite dplyr verbs to easily remove personal data from data frames:

## Limitations
Smudge is not designed to replace responsible management of personal data. Rather, it is a quick and dirty method for quickly removing personal data from text. Under the hood it uses a combination of regular expressions and lookup tables.

## Getting help
If you encounter a clear bug, please file a minimal reproducible example
in [issues](https://github.com/MikeJohnPage/smudge/issues).
