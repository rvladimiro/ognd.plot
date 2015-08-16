#' @name box_plot
#' @title Creaate box plots
#' @description Wrapper for ggplot() + geom_boxplot() visualisations
#' @details This function allows the creation of box plots in one line. It
#'          handles color automatically, according to the dimension given. The
#'          box plot always needs a measure and a dimension.
#' @examples
#' # Set the seed
#' set.seed(1714)
#'
#' # Create the variables
#' my_measure = rnorm(1000) + rep(c(0, 1.1, 1.2, 1.4, 1.8), 200)
#' my_dimension = as.factor(rep(c("A", "B", "C", "D", "E"), 200))
#' my_facet = as.factor(rep(c("One", "Another"), 500))
#' my_dataframe = data.frame(x = my_dimension, y = my_measure, f = my_facet)
#'
#' # Test single vector
#' ognd_boxplot(measure = my_measure,
#'              dimension = my_dimension,
#'              title = "Simple box plot")
#'
#' # Wait for key stroke
#' key_stroke = readline(prompt = 'Press Enter to continue...')
#'
#' # Test dataframe and labels
#' ognd_boxplot(measure = y,
#'              dimension = x,
#'              dataframe = my_dataframe,
#'              title = "Dataframe and labels",
#'              measure_label = "Values",
#'              dimension_label = "Dimensions",
#'              facet_formula = ~f)
#'
#' @param measure The measure of interest. The continuous variable from which
#'        the box plots are drawn.
#' @param dimension The dimension separates the several box plots of the
#'        visualisation. It also defines the color of each box plot.
#' @param dataframe An optional dataframe. If a dataframe is provided, all
#'        variables (measure and dimension) must be columns of the dataframe.
#' @param alpha The transparency of the fill of the box plots. Alpha does not
#'        affect the lines of the box plots.
#' @param notch If true (default) notchs are added to the boxplots.
#' @param title The title of the plot
#' @param measure_label The measure (y axis) label. If not used, the name of
#'        the variable passed to the measure parameter is used.
#' @param dimension_label The dimension (x axis) label. If not used, the name
#'        of the variable passed to the dimension parameter is used.
#' @param facet_formula The formula to create facet grids on ggplot.
#' @export
ognd_boxplot = function(measure,
                        dimension,
                        dataframe = NULL,
                        alpha = 0.66,
                        notch = T,
                        title = NULL,
                        measure_label = NULL,
                        dimension_label = NULL,
                        facet_formula = NULL) {

  measure_name = deparse(substitute(measure))
  dimension_name = deparse(substitute(dimension))

  #if (!is.null(x_label)) x_label = dimension_name

  plot = ggplot(mapping = aes_string(x = dimension_name,
                                     y = measure_name,
                                     color = dimension_name,
                                     fill = dimension_name),
                data = dataframe) +
         geom_boxplot(alpha = alpha,
                      outlier.colour = "gray30",
                      outlier.shape = 1,
                      notch = notch) +
         scale_colour_brewer(palette = 'Set1') +
         scale_fill_brewer(palette = 'Set1')

  return(format_plot(plot = plot,
                     title = title,
                     x_label = dimension_label,
                     y_label = measure_label,
                     color_title = dimension_label,
                     facet_formula = facet_formula))
}
