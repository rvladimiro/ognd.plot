
format_plot <- function(plot, title = NULL, x_label = NULL, y_label = NULL, facet_formula = NULL) {

  if(!is.null(title)) {
    plot = plot + ggtitle(paste0(title, '\n'))
  }

  if(!is.null(x_label)) {
    plot = plot + xlab(x_label)
  }

  if(!is.null(y_label)) {
    plot = plot + ylab(y_label)
  }

  if(!is.null(facet_formula)) {
    plot = plot + facet_grid(facet_formula) + theme_bw(base_size = 10)
  } else {
    plot = plot +
      theme_bw(base_size = 10) +
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
