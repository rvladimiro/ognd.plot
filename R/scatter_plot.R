#' @name scatter_plot
#' @title Create a scatter plot or bubble chart
#' @description Wrapper for ggplot() + geom_point() visualisations
#' @details This function allows the creation of scatter plots and bubble
#'          charts in one line. It handles color and size automatically
#'          using predefined settings.
#' @examples
#' # Load packages
#' library(gridExtra)
#'
#' # Set a seed to always have the same results
#' set.seed(0010)
#'
#' # Create vectors
#' var_x = sort(rnorm(100))
#' var_y = var_x * 2 + rnorm(100)
#' var_z = c(rep('A', 25), rep('B', 25), rep('C', 25), rep('D', 25))
#' var_s = rnorm(100)
#' var_f1 = sample(x = c('Alpha', 'Bravo'), size = 100, replace = T)
#' var_f2 = sample(x = c('Sierra', 'Tango'), size = 100, replace = T)
#'
#' # Create dataframe
#' df = data.frame(x = var_x, y = var_y, z = var_z, s = var_s,
#'                 a = var_f1, b = var_f2)
#'
#' # Create scatter plots
#' p1 = scatter_plot(x = var_x, y = var_y,
#'                   title = 'Simple')
#' p2 = scatter_plot(x = var_x, y = var_y, color = var_z,
#'                   title = 'With categorical color')
#' p3 = scatter_plot(x = var_x, y = var_y, size = var_s,
#'                   title = 'With size')
#' p4 = scatter_plot(x = var_x, y = var_y, color = var_x, size = var_s,
#'                   title = 'With continuous color and size')
#'
#' # Plot them
#' grid.arrange(p1, p2, p3, p4, ncol = 2)
#'
#' # Wait for key stroke
#' key_stroke = readline(prompt = 'Press Enter to continue...')
#'
#' # Plot facets
#' scatter_plot(x = x,
#'              y = y,
#'              dataframe = df,
#'              color = z,
#'              size = s,
#'              title = 'All plus df, labels and facets',
#'              x_label = 'My X Var',
#'              y_label = 'My Y Var',
#'              color_title = 'Color',
#'              size_title = 'Size',
#'              facet_formula = a ~ b)
#'
#' @param x The x axis variable
#' @param y The y axis variable
#' @param dataframe An optional dataframe. If dataframe is used, all variables
#'        (x, y, color and size) must be of the dataframe.
#' @param color A vector of the same length of x and y. An arbitrary color
#'        (e.g. "blue") cannot be used. If vector color is not provided, the
#'        default color is blue.
#' @param alpha The transparency of the data points.
#' @param size A vector of the same length of x and y. An arbitrary size (e.g.
#'        8) cannot be used.
#' @param title The title of the plot
#' @param x_label The x axis label. If no label is given, the name of the x
#'        variable is used.
#' @param y_label The y axis label. If no label is given, the name of the y
#'        variable is used.
#' @param color_title The title of the color legend. If there is no color
#'        vector, the color_title is ignored.
#' @param size_title The title of the size legend. If there is no size vector,
#'        the size_title is ignored.
#' @param facet_formula The formula to create facet grids on ggplot.
#' @export
scatter_plot <- function(x,                   # x axis variable
                         y,                   # y axis variable
                         dataframe = NULL,    # data.frame
                         color = NULL,        # color vector
                         size = NULL,         # size vector
                         alpha = 0.66,        # alpha value of the points
                         title = NULL,        # Title string
                         x_label = NULL,      # x axis label
                         y_label = NULL,      # y axis label
                         color_title = NULL,  # legend color title
                         size_title = NULL,   # legend size title
                         facet_formula = NULL # facet formula to create facets
                         ) {



  # Get variable names
  x_name = deparse(substitute(x))
  y_name = deparse(substitute(y))
  color_name = deparse(substitute(color))
  size_name = deparse(substitute(size))

  # Get color and size values
  color_values = eval(substitute(color), dataframe, parent.frame())
  size_values = eval(substitute(size), dataframe, parent.frame())




  # Determine the type of viz to produce.
  #   0: Simple, no color and no size
  #   1: Color used, no size
  #   2: Size used, no color
  #   3: Both size and color used
  #
  # First check if color variable is null. If it isn't, viz_type takes the
  # value of 1. If it is, takes the value of 0.
  viz_type = as.integer(!is.null(color_values))
  # Second check if size variable is null. If it isn't, viz_type is added 2.
  # If it is null, viz_type maintains its value.
  viz_type = viz_type + 2 * !is.null(size_values)



  # Plot a scatter plot with no color and no size
  if (viz_type == 0) {

    plot = ggplot(mapping = aes_string(x = x_name, y = y_name),
                  data = dataframe) +
           geom_point(color = 'blue', alpha = alpha)

  }



  # Create a scatter plot with color but no size
  if (viz_type == 1) {

    plot = ggplot(mapping = aes_string(x = x_name,
                                       y = y_name,
                                       color = color_name),
                  data = dataframe) +
           geom_point(alpha = alpha)

  }



  # Create a scatter plot with size but no color
  if (viz_type == 2) {

    plot = ggplot(mapping = aes_string(x = x_name,
                                       y = y_name,
                                       size = size_name),
                  data = dataframe) +
           geom_point(color = 'blue', alpha = alpha)

  }



  # Create a scatter plot with size and color
  if (viz_type == 3) {

    plot = ggplot(mapping = aes_string(x = x_name,
                                       y = y_name,
                                       color = color_name,
                                       size = size_name),
                  data = dataframe) +
           geom_point(alpha = alpha)

  }



  # Take care of the color scales if the viz has color. The variable viz_type
  # is a odd number if color is present.
  if (viz_type %% 2 != 0) {

    # The color of the points depend of the type of variable
    # If it is a numeric variable, it is a continuous scale
    if (is.numeric(color_values)) {
      plot = plot + scale_colour_gradient(low = 'green', high = 'red')

    # If it is not a numeric variable it is treated as a discrete variable
    } else {
      plot = plot + scale_colour_brewer(palette = 'Set1')
    }

  }

  # Format the plot and return it
  return(format_plot(plot,
                     title,
                     x_label,
                     y_label,
                     color_title,
                     size_title,
                     facet_formula))

}
