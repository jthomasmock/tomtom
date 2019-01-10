#' Create the R4DS Community TidyTuesday posts
#'
#' @import purrr rtweet glue emo here lubridate
#' @export
#'

post_tidytuesday <- function(exploring, long_link){

    # Authenticate each session
    tinycc::auth(tinycc_login = Sys.getenv("secret_login"),
                 tinycc_api_key = Sys.getenv("secret_api_key"))

    # set date for files structure and names
    week_date <- as.character(lubridate::today() + 1)
    week_num <- as.numeric((lubridate::today() + 1) - lubridate::ymd(20190101))/7


    # Generate the short_link
    short_link <- tinycc::shorten(longURL = long_link,
                                  shortURL = glue::glue("tt_2019_{week_num}")) %>%
        purrr::pluck("results", "short_url")

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
                  here::here("2019", week_date, "pic1.png")
        ))
}
