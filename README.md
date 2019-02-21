# tomtom

tomtom is my miscellaneous functions package, more of which are becoming useful `TidyTuesday` functions. Things should be fairly stable... but caveat emptor!


## Installation

You can install the dev version of `tomtom` from GitHub with:

``` r
devtools::install_github("jthomasmock/tomtom")
```

## Functions

* add_logo() - Adds a logo to your image or saved `ggplot`  
* neg() - Negates a number (useful for the example of `x < -5` to prevent assignment  
* post_tidytuesday() - Posts via `rtweet` the Weekly `TidyTuesday` update   
* create_dictionary() - Creates the data dictionary for `TidyTuesday` posts  
* std_err() - Calculate standard error.  
* str_remove_right() - Removes `n` letters starting from the right of a string  
* substr_right() - Selects `n` letters starting from the right of a string  
* theme_tom() - a `ggplot2` theme similar to `fivethirtyeight` plots  
* geom_bullet() - a full-fledged way to plot bullet graphs in R
* tweet_embed() - get markdown formatted Tweet for embedding

