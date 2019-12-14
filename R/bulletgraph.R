#' Code to generate a bullet graph
#'
#' @importFrom dplyr distinct
#' @import ggplot2
#' @export


# Highly borrowed from hrbrmstr
# https://github.com/hrbrmstr/Rbulletgraph
# http://www.perceptualedge.com/articles/misc/Bullet_Graph_Design_Spec.pdf
# https://en.wikipedia.org/wiki/Bullet_graph

geom_bullet <- function(df, # input dataframe
                        target, # target - static in this example
                        var_group, # typically the x-coordinate prior to coord-flip
                        var_value, # typically the y-coordinate prior to coord-flip
                        max_decimal = 0.85, # percentage for max range
                        high_decimal = 0.8, # percentage for high range
                        low_decimal = 0.6) { # percentage for the low range

  # tidyeval for programming ggplot2
  x_var <- enquo(var_group)
  y_var <- enquo(var_value)

  # Calculate the percentages for scaled ranges
  # the max_range ends up being 100% with target as 85%
  # high percent is 80% of the max
  # low percent is 60% of the max

  max_range <- target / max_decimal
  high_percent <- max_range * high_decimal
  low_percent <- target * low_decimal

  # get number of factors to correcty apply the annotate labels
  # that correspond to the good, acceptable, poor ranges
  n_factors <- nrow(dplyr::distinct(df, !!x_var))

  # build the ggplot2
  ggplot(df, aes(x = !!x_var, y = !!y_var)) +
    geom_col(aes(x = !!x_var, y = max_range), width = 0.6, fill = "grey1", alpha = 0.3) +
    geom_col(aes(x = !!x_var, y = high_percent), width = 0.6, fill = "grey2", alpha = 0.3) +
    geom_col(aes(x = !!x_var, y = low_percent), width = 0.6, fill = "grey3", alpha = 0.3) +
    geom_col(width = 0.4, fill = "black") +
    geom_point(aes(x = !!x_var, y = target), color = "red", size = 5) +
    geom_errorbar(aes(x = !!x_var, ymin = target, ymax = target),
      color = "red",
      width = 0.45,
      size = 2
    ) +
    annotate("text",
      x = c(rep((n_factors + .45), 3), (n_factors - 1 + .6)),
      y = c(target * 0.3, target * 0.75, target, target),
      label = c("Poor", "Acceptable", "Good", "Target"),
      color = c(rep("black", 3), "red"),
      fontface = rep(2, 4)
    ) +
    coord_flip() +
    theme_minimal()
}
