#' @export
bar_chart = function(measure,
                     dimension,
                     group = NULL,
                     dataframe = NULL,
                     alpha = 0.66,
                     bar_position = 'dodge',
                     flip_coordinates = F,
                     title = NULL,
                     measure_label = NULL,
                     dimension_label = NULL,
                     group_title = NULL){
  
  measure_name = deparse(substitute(measure))
  dimension_name = deparse(substitute(dimension))
  group_name = deparse(substitute(group))
  group_values = eval(substitute(group), dataframe, parent.frame())
  
  if (!is.null(group_values)) {
    
    
    plot = ggplot() +
           geom_bar(mapping = aes_string(x = dimension_name,
                                         y = measure_name,
                                         #width = 0.7,
                                         #color = group_name,
                                         fill = group_name),
                    data = dataframe,
                    alpha = alpha,
                    stat = 'identity',
                    position = bar_position) +
      #scale_colour_brewer(palette = 'Set1') +
      scale_fill_brewer(palette = 'Set1')
  } else {
    
    plot = ggplot() +
           geom_bar(mapping = aes_string(x = dimension_name,
                                         y = measure_name),
                    data = dataframe,
                    #color = 'blue',
                    fill = 'blue',
                    alpha = alpha,
                    stat = 'identity',
                    position = bar_position)
  }
  
  
  
  
  if (flip_coordinates) {
    plot = plot + coord_flip()
  }
  
  return(format_plot(plot,
                     title,
                     x_label = dimension_label,
                     y_label = measure_name,
                     color_title = group_title))
    
}
