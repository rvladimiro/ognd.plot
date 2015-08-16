# Load packages
library(gridExtra)

# Set a seed to always have the same results
set.seed(0010)

# Create vectors
var_x = sort(rnorm(100))
var_y = var_x * 2 + rnorm(100)
var_z = c(rep('A', 25), rep('B', 25), rep('C', 25), rep('D', 25))
var_s = rnorm(100)
var_f1 = sample(x = c('Alpha', 'Bravo'), size = 100, replace = T)
var_f2 = sample(x = c('Sierra', 'Tango'), size = 100, replace = T)

# Create dataframe
df = data.frame(x = var_x, y = var_y, z = var_z, s = var_s,
                a = var_f1, b = var_f2)

# Create scatter plots
p1 = scatter_plot(x = var_x, y = var_y,
                  title = 'Simple')
p2 = scatter_plot(x = var_x, y = var_y, color = var_z,
                  title = 'With categorical color')
p3 = scatter_plot(x = var_x, y = var_y, size = var_s,
                  title = 'With size')
p4 = scatter_plot(x = var_x, y = var_y, color = var_x, size = var_s,
                  title = 'With continuous color and size')

# Plot them
grid.arrange(p1, p2, p3, p4, ncol = 2)

# Wait for key stroke
key_stroke = readline(prompt = 'Press Enter to continue...')

# Plot facets
scatter_plot(x = x,
             y = y,
             dataframe = df,
             color = z,
             size = s,
             title = 'All plus df, labels and facets',
             x_label = 'My X Var',
             y_label = 'My Y Var',
             color_title = 'Color',
             size_title = 'Size',
             facet_formula = a ~ b)
