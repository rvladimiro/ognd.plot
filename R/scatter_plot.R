
scatter_plot <- function(x,                   # x axis variable
                         y,                   # y axis variable
                         dataframe = NULL,    # data.frame
                         color = NULL,        # color vector
                         alpha = 0.66,        # alpha value of the points
                         title = NULL,        # Title string
                         x_label = NULL,      # x axis label
                         y_label = NULL,      # y axis label
                         facet_formula = NULL # facet formula to create facets
                         ) {

  # Get variable names
  x_name = deparse(substitute(x))
  y_name = deparse(substitute(y))

  # Get the color values
  # I need this to understand if the color will be used or not
  color_values = eval(substitute(color), dataframe, parent.frame())

  # If color doesn't exist...
  if (is.null(color_values)) {

    # Create a plot without any color treatment
    plot = ggplot() +
      geom_point(
        aes_string(x = x_name, y = y_name),
        color = 'blue',
        alpha = alpha,
        size = 5,
        data = dataframe
      )

  # If color exists treat it accordingly
  } else {

    # Get the name of the variable to be passed to aesthetics
    color_name = deparse(substitute(color))

    # Create the plot with color_name
    plot = ggplot() +
      geom_point(
        aes_string(x = x_name, y = y_name, color = color_name),
        alpha = alpha,
        size = 5,
        data = dataframe
      )

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
  return(format_plot(plot, title, x_label, y_label, facet_formula))

}
