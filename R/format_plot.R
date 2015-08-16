# Helper function to format plots
format_plot <- function(plot,                # The plot to format
                        title = NULL,        # Plot title
                        x_label = NULL,      # Label of x axis
                        y_label = NULL,      # Label of y axis
                        color_title = NULL,  # Legend title for color var
                        size_title = NULL,   # Legend title for size var
                        facet_formula = NULL # The formula to create facets
                        ) {

  # Adds titles and labels

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



  # If there's a facet formula the plot is formated to have a centered title
  # and the panel borders are not removed to keep the several plots clearly
  # separated.
  if(!is.null(facet_formula)) {
    plot = plot +
           facet_grid(facet_formula) +
           theme_bw() +
           theme(legend.position = 'bottom',
                 plot.title = element_text(family = 'Trebuchet MS',
                                           face = 'bold',
                                           size = 16))
  # If there isn't a facet formula, the panel borders are removed and axis
  # lines are drawn in black. The title is aligned to the right.
  } else {
    plot = plot +
           theme_bw() +
           theme(axis.line = element_line(colour = "black"),
                 legend.position = 'bottom',
                 panel.border = element_blank(),
                 panel.background = element_blank(),
                 plot.title = element_text(hjust = 1,
                                           family = 'Trebuchet MS',
                                           face = 'bold',
                                           size = 16))
  }

  # Returns the formatted plot
  return(plot)
}
