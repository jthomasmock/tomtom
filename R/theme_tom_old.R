#' Personal theme inspired by ggthemes::theme_fivethirtyeight and fivethirtyeight.com
#'
#' Theme inspired by the plots on
#' \href{ggthemes::theme_fivethirtyeight}{https://github.com/jrnold/ggthemes/blob/master/R/fivethirtyeight.R}.
#' @import ggplot2
#' @export theme_538

theme_538 <- function(base_size = 12, font = "Lato"){

    ### Palette

    # http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/#a-colorblind-friendly-palette
    cb_palette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
    # https://www.color-hex.com/color-palette/74767
    tom_palette <- c("#003399", "#ff2b4f", "#3686d3", "#FCAB27", "#88398a")
    # murdoch theme https://gist.github.com/johnburnmurdoch/bd20db77b2582031604ccd1bdc4be582
    ft_palette <- c("#00218D","#FF2B4F","#0083EB","#FCAB27","#FF49EF")

    # color pieces
    scale_fill_cb <- function(){

        structure(list(
            scale_fill_manual(values = cb_palette)
        ))
    }

    scale_color_discrete_cb<- function(){

        structure(list(
            scale_color_manual(values = cb_palette)
        ))
    }

    scale_color_continuous_cb <- function(){

        structure(list(
            scale_color_gradientn(colours = cb_palette)
        ))
    }

    # Text setting
    txt <- element_text(size = base_size + 2, colour = "black", face = "plain")
    bold_txt <- element_text(size = base_size + 2, colour = "black",
                             family = "Montserrat", face = "bold")
    large_txt <- element_text(size = base_size + 4, color = "black", face = "bold")


    theme_minimal(base_size = base_size, base_family = font) + #%+replace%
        theme(
            # Legend Settings
            legend.key = element_blank(),
            legend.background = element_blank(),
            legend.position = "bottom",
            legend.direction = "horizontal",
            legend.box = "vertical",

            # Backgrounds
            strip.background = element_rect(),
            plot.background = element_rect(),
            plot.margin = unit(c(1, 1, 1, 1), "lines"),

            # Shapes
            # line_set = element_line(
            #     colour = "black",
            #     size = rel(0.5),
            #     linetype = "solid"),
            # rect_set = element_rect(
            #     fill = "#F0F0F0",
            #     linetype = 0,
            #     colour = NA),

            # Axis & Titles
            text = txt,
            axis.text = txt,
            axis.ticks = element_blank(),
            axis.line = element_blank(),
            # axis.line = element_line(
            #     colour = "black",
            #     size = rel(0.5),
            #     linetype = "solid"),
            axis.title = bold_txt,
            plot.title = large_txt,

            # Panel
            panel.grid = element_line(colour = NULL),
            panel.grid.major = element_line(colour = "#D2D2D2"),
            panel.grid.minor = element_blank()
        )
    }

#
# .onAttach <- function(pkgname, libname) {
#     my_palette <- c('blue', 'black', 'red')
#     my_theme <- theme_bw() + theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
#     theme_set(my_theme)
#
#     assign("scale_colour_discrete", function(..., values = my_palette) scale_colour_manual(..., values = values), globalenv())
#     assign("scale_fill_discrete", function(..., values = my_palette) scale_fill_manual(..., values = values), globalenv())
# }
