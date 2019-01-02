#' Theme inspired by fivethirtyeight.com plots
#'
#' Theme inspired by the plots on
#' \href{fivethirtyeight.com}{http://fivethirtyeight.com}.
#' @import ggplot2 hrbrthemes
#' @export
#'
theme_tomtom <- function(base_size = 13, base_family = "") {

    theme_ipsum_tw(axis_title_just = "center") +
        theme_minimal(base_size = base_size, base_family = base_family) %+replace%
        theme(
        line = element_line(colour = "black"),
        rect = element_rect(
            fill = "#F0F0F0",
            linetype = 0, colour = NA),
        text = element_text(colour = "#3C3C3C"),
        axis.text = element_text(),
        axis.ticks = element_blank(),
        axis.line = element_blank(),
        legend.background = element_rect(),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.box = "vertical",
        panel.grid = element_line(colour = NULL),
        panel.grid.major = element_line(colour = "#D2D2D2"),
        panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0, size = rel(1.5), face = "bold"),
        #plot.margin = unit(c(1, 1, 1, 1), "lines"),
        strip.background = element_rect(),
        plot.background = element_rect()
    )
}
