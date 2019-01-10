#' A negative Function
#'
#' This function allows you to create a negative number when it might
#' accidentally create an assignment operator.
#' @keywords negative, assignment
#' @export
#' @examples x < -5 # this actually assigns -5 to x, rather than
#' Checking whether x is less than -5.
#' neg()

neg <- function(x) {
    -x
}

#' A remove from end of string function
#'
#' This function allows you to remove n characters starting from the end
#' of a string.
#' @keywords string, end, remove
#' @export
#' @examples Remove last 3 characters with str_remove_right(string, 3)
#' str_remove_right
str_remove_right <- function(x, n){
    substr(x,1,nchar(x)-n)
}

#' A select from function
#'
#' This function allows you to select characters starting from the end
#' of a string.
#' @keywords string, end
#' @export
#' @examples Select last 3 characters with substr_right(string, 3)
#' substr_right()
substr_right <- function(x, n){
        substr(x,
               nchar(x) - n + 1,
               nchar(x)
               )
    }

#' A standard error function
#'
#' This function allows you to calculate the standard error of a sample.
#' @keywords standard error
#' @export
#' @examples
#'
#'
#'
std_err <- function(x){
    sd(x, na.rm = T)/sqrt(len(x))
}


#' Add a logo to your plot or image
#'
#' This function places a logo at one of the corners of your image/plot
#'
#' @export
#' @import magick

add_logo <- function(plot_path, logo_path, logo_position, logo_scale = 10){

    # Requires magick R Package

    # Useful error message for logo position
    if (!logo_position %in% c("top right", "top left", "bottom right", "bottom left")) {
        stop("Error Message: Uh oh! Logo Position not recognized\n  Try: logo_positon = 'top left', 'top right', 'bottom left', or 'bottom right'")
    }

    # read in raw images
    plot <- magick::image_read(plot_path)
    logo_raw <- magick::image_read(logo_path)

    # get dimensions of plot for scaling
    plot_height <- magick::image_info(plot)$height
    plot_width <- magick::image_info(plot)$width

    # default scale to 1/10th width of plot
    # can change by altering logo_scale
    logo <- magick::image_scale(logo_raw, as.character(plot_width/logo_scale))

    # Get width of logo
    logo_width <- magick::image_info(logo)$width
    logo_height <- magick::image_info(logo)$height


    # Set position of logo
    # Position starts at 0,0 at top left
    # Using 0.01 for 1% - aesthetic padding

    if (logo_position == "top right") {
        x_pos = plot_width - logo_width - 0.01 * plot_width
        y_pos = 0.01 * plot_height
    } else if (logo_position == "top left") {
        x_pos = 0.01 * plot_width
        y_pos = 0.01 * plot_height
    } else if (logo_position == "bottom right") {
        x_pos = plot_width - logo_width - 0.01 * plot_width
        y_pos = plot_height - logo_height - 0.01 * plot_height
    } else if (logo_position == "bottom left") {
        x_pos = 0.01 * plot_width
        y_pos = plot_height - logo_height - 0.01 * plot_height
    }

    # Compose the actual overlay
    magick::image_composite(plot, logo, offset = paste0("+", x_pos, "+", y_pos))

}
