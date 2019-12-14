#' Personal theme inspired by bbplot
#' https://github.com/bbc/bbplot/blob/master/R/bbc_style.R
#'
#' Theme inspired by the plots on
#' \href{bbplot}{https://github.com/bbc/bbplot/blob/master/R/bbc_style.R}.
#' @export theme_tomtom
#'

theme_tomtom <- function() {
  font <- "Fira Sans"

  ggplot2::theme(

    # Text format:
    # This sets the font, size, type and colour of text for the chart's title
    plot.title = ggplot2::element_text(
      family = font,
      size = 28,
      face = "bold",
      color = "#222222"
    ),
    # This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
    plot.subtitle = ggplot2::element_text(
      family = font,
      size = 22,
      margin = ggplot2::margin(9, 0, 9, 0)
    ),
    plot.caption = ggplot2::element_text(
      family = font,
      size = 22,
      face = "bold",
      color = "#222222"
    ),
    # This leaves the caption text element empty, because it is set elsewhere in the finalise plot function

    # Legend format
    # This sets the position and alignment of the legend, removes a title and backround for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
    legend.position = "top",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(
      family = font,
      size = 18,
      color = "#222222"
    ),

    # Axis format
    # This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
    # axis.title = ggplot2::element_blank(),
    axis.text = ggplot2::element_text(
      family = font,
      size = 18,
      color = "#222222"
    ),
    axis.text.x = ggplot2::element_text(margin = ggplot2::margin(5, b = 10)),
    axis.ticks = ggplot2::element_blank(),
    axis.line = ggplot2::element_blank(),

    # Grid lines
    # This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color = "#cbcbcb"),
    panel.grid.major.x = ggplot2::element_blank(),

    # Blank background
    # This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
    panel.background = ggplot2::element_blank(),

    # Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
    strip.background = ggplot2::element_rect(fill = "white"),
    strip.text = ggplot2::element_text(size = 22, hjust = 0)
  ) +
    ggplot2::theme(
      axis.line = ggplot2::element_blank()
    )
}

tomtom_colors <- c(
  `red` = "#ff2b4f",
  `green` = "#00b159",
  `blue` = "#003399",
  `orange` = "#fcab27",
  `yellow` = "#ffc425",
  `purple` = "#88398a",
  `rstudio blue` = "#3686d3",
  `light grey` = "#cccccc",
  `dark grey` = "#8c8c8c",
  `ft dark blue` = "#00218D",
  `ft light blue` = "#0083EB",
  `ft red` = "#ff2b4f",
  `ft pink` = "#ff49ef",
  `ft orange` = "#fcab27"
)

#' Function to extract tomtom colors as hex codes
#'
#' @param ... Character names of tomtom_colors
#'
tomtom_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols)) {
    return(tomtom_colors)
  }

  tomtom_colors[cols]
}

#' @export
tomtom_palettes <- list(
  `main` = tomtom_cols("blue", "red", "orange"),

  `cool` = tomtom_cols("blue", "green"),

  `full` = tomtom_cols("blue", "red", "orange", "rstudio blue", "purple"),

  `grey` = tomtom_cols("light grey", "dark grey"),

  # murdoch theme https://gist.github.com/johnburnmurdoch/bd20db77b2582031604ccd1bdc4be582
  `ft` = tomtom_cols("ft dark blue", "ft orange", "ft red", "ft light blue", "ft pink")


  # http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/#a-colorblind-friendly-palette
  # `cb_pal` = c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7"),
)



#' @export
#'
palette_picker <- function(name = "main", n, type = c("discrete", "continuous"),
                           reverse = FALSE) {
  type <- match.arg(type)

  pal <- tomtom_palettes[[name]]

  if (reverse) pal <- rev(pal)

  if (is.null(pal)) {
    stop("Palette not found.")
  }

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
    continuous = grDevices::colorRampPalette(pal)(n),
    discrete = pal[1:n]
  ) %>% as.vector()
  structure(out, class = "palette", name = name)
}
