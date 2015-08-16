
format_plot <- function(plot,
                        title = NULL,
                        x_label = NULL,
                        y_label = NULL,
                        color_title = NULL,
                        size_title = NULL,
                        facet_formula = NULL) {

  if (!is.null(title)) {
    plot = plot + ggtitle(paste0(title, '\n'))
  }

  if(!is.null(x_label)) {
    plot = plot + xlab(x_label)
  }

  if(!is.null(y_label)) {
    plot = plot + ylab(y_label)
  }

  if (!is.null(color_title)) {
    plot = plot + labs(color = color_title)
  }

  if (!is.null(size_title)) {
    plot = plot + labs(size = size_title)
  }


  if(!is.null(facet_formula)) {
    plot = plot +
      facet_grid(facet_formula) +
      theme_bw() +
      theme(
        legend.position = 'bottom',
        plot.title =
          element_text(family = 'Trebuchet MS', face = 'bold', size = 16))
  } else {
    plot = plot +
      theme_bw() +
      theme(
        axis.line = element_line(colour = "black"),
        legend.position = 'bottom',
        panel.border = element_blank(),
        panel.background = element_blank(),
        plot.title =
          element_text(hjust = 1, family = 'Trebuchet MS', face = 'bold', size = 16)
      )

  }

  return(plot)
}
