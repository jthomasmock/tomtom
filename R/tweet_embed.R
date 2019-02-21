#' @title Create markdown embed for a Tweet
#' @description The Twitter API GET call returns the tweet in markdown embedded format
#' @param screen_name character, screen name of the user
#' @param status_id character, status id
#' @return character
#' @details Arguments to pass to the API call can be found \href{https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/get-statuses-oembed}{here}
#' @examples
#' name   <- 'kearneymw'
#' status <- '1087047171306856451'
#'
#' tweet_embed(screen_name = name, status_id = status)
#'
#' @export
#' @importFrom httr GET content
#'

tweet_embed <- function(screen_name, status_id){

    core_url <- "https://publish.twitter.com/oembed?url=https%3A%2F%2Ftwitter.com%2F"
    status_url <- "%2Fstatus%2F"

    url <- paste0(core_url, screen_name, status_url, status_id)

    api_payload <- httr::GET(url)

    api_content <- httr::content(api_payload)

    api_content[["html"]]
}
