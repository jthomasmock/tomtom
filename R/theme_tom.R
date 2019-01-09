#' Personal theme inspired by ggthemes::theme_fivethirtyeight and fivethirtyeight.com
#'
#' Theme inspired by the plots on
#' \href{ggthemes::theme_fivethirtyeight}{https://github.com/jrnold/ggthemes/blob/master/R/fivethirtyeight.R}.
#' @import ggplot2
#' @export theme_tom
#'

theme_tom <- function(base_size = 12, font = "Titillium Web"){

    ### Palette

    # http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/#a-colorblind-friendly-palette
    cb_palette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

    # color pieces
    scale_fill_cb <- function(){

        structure(list(
            scale_fill_manual(values=cb_palette)
        ))
    }

    scale_color_discrete_cb<- function(){

        structure(list(
            scale_color_manual(values=cb_palette)
        ))
    }

    scale_color_continuous_cb <- function(){

        structure(list(
            scale_color_gradientn(colours = cb_palette)
        ))
    }

    # Text setting
    txt <- element_text(size = base_size + 2, colour = "black", face = "plain")
    bold_txt <- element_text(size = base_size + 2, colour = "black", face = "bold")
    large_txt <- element_text(size = base_size + 4, color = "black", face = "bold")

    theme_minimal(base_size = base_size, base_family = font) +
        theme(
            # Legend Settings
            legend.key = element_blank(),
            legend.background = element_blank(),
            legend.position = "bottom",
            legend.direction = "horizontal",
            legend.box = "vertical",

            # Shapes
            line = element_line(
                colour = "black", size = rel(0.5),
                linetype = "solid", lineend = "round"),
            rect = element_rect(
                fill = "#F0F0F0",
                linetype = 0, colour = NA),

            # Backgrounds
            strip.background = element_rect(),
            plot.background = element_rect(),
            plot.margin = unit(c(1, 1, 1, 1), "lines"),

            # Axis & Titles
            text = txt,
            axis.text = bold_txt,
            axis.ticks = element_blank(),
            axis.line = element_blank(),
            axis.title = bold_txt,
            plot.title = large_txt,

            # Panel
            panel.grid = element_line(colour = NULL),
            panel.grid.major = element_line(colour = "#D2D2D2"),
            panel.grid.minor = element_blank()

        )
}
