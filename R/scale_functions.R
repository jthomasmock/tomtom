#' @export
tomtom_pal <- function(palette = "main", n, reverse = FALSE, ...) {
    pal <- tomtom_palettes[[palette]]

    if (reverse) pal <- rev(pal)

    colorRampPalette(pal, ...)(n)
}

#' Color scale constructor for tomtom colors
#'
#' @param palette Character name of palette in tomtom_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
#'


scale_color_tomtom <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
    pal <- tomtom_pal(palette = palette, reverse = reverse)

    if (discrete) {
        discrete_scale("colour", paste0("tomtom_", palette), palette = pal, ...)
    } else {
        scale_color_gradientn(colours = pal(256), ...)
    }
}

#scale_color_tomtom <- scale_colour_tomtom

#' Fill scale constructor for tomtom colors
#'
#' @param palette Character name of palette in tomtom_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @export

scale_fill_tomtom <- function(palette = "main", discrete = TRUE,
                              reverse = FALSE, ...) {
    pal <- tomtom_pal(palette = palette, reverse = reverse)

    if (discrete) {
        discrete_scale("colour", paste0("tomtom_", palette), palette = pal, ...)
    } else {
        scale_color_gradientn(colours = pal(256), ...)
    }
}
