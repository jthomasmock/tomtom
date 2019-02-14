#' Create the R4DS Community TidyTuesday posts
#'
#' @import purrr rtweet glue emo here lubridate
#' @export
#'


post_tidytuesday <- function(exploring, short_link){

    # set date for files structure and names
    week_date <- as.character(lubridate::today() + 1)

    # Today's date + 1 = tomorrow
    # Then time diff between tomorrow and 1st tidytuesday in number of weeks
    week_num <- as.numeric((lubridate::today() + 1) - lubridate::ymd(20190101))/7 + 1

    # post the tweet with fill
    rtweet::post_tweet(status = glue::glue(
        "The @R4DScommunity welcomes you to week {week_num} of #TidyTuesday!  We're exploring {exploring}!

",
        emo::ji("folder"),
        " http://bit.ly/tidyreadme
",
        emo::ji("news"),
        " {short_link}

#r4ds #tidyverse #rstats #dataviz"),

        # The below code is relative to my project
        # You need to specify path to the images for tweeting
        media = c(here::here("static_img", "tt_logo.png"),
                  here::here("static_img", "tt_rules.png"),
                  here::here("2019", week_date, "pic1.png"),
                  here::here("2019", week_date, "pic2.png")
        ))
}

#' Create the TidyTuesday data dictionary
#' @import dplyr tibble knitr
#' @export

create_dictionary <- function(x) {
    tibble::tibble(variable = names(x)) %>%
    dplyr::mutate(class = purrr::map(x, typeof),
                  description = ".") %>%
    knitr::kable()
    }
