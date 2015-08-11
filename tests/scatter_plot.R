# Load packages
library(gridExtra)

# Set a seed to always have the same results
set.seed(0010)

# Create vectors
var_x = sort(rnorm(100))
var_y = var_x * 2 + rnorm(100)
var_z = c(rep('A', 25), rep('B', 25), rep('C', 25), rep('D', 25))
var_f1 = sample(x = c('Alpha', 'Bravo'), size = 100, replace = T)
var_f2 = sample(x = c('Sierra', 'Tango'), size = 100, replace = T)

# Create dataframe
df = data.frame(x = var_x, y = var_y, z = var_z, a = var_f1, b = var_f2)

# Create scatter plots
p1 = scatter_plot(x = var_x, y = var_y, title = 'Simple Scatter Plot')
p2 = scatter_plot(x = x, y = y, dataframe = df, title = 'With data.frame')
p3 = scatter_plot(x = var_x,
                  y = var_y,
                  color = var_z,
                  title = 'Discrete Color and Labels',
                  x_label = 'My X Var',
                  y_label = 'My Y Var')
p4 = scatter_plot(x = x,
                  y = y,
                  color = x,
                  dataframe = df,
                  title = 'Continuous Color with data.frame')

# Plot them
grid.arrange(p1, p2, p3, p4, ncol = 2)

# Wait for key stroke
key_stroke = readline(prompt = 'Press Enter to continue...')

# Plot facets
scatter_plot(x = x,
             y = y,
             dataframe = df,
             color = z,
             title = 'Discrete Color, Labels and Facet',
             x_label = 'My X Var',
             y_label = 'My Y Var',
             facet_formula = a ~ b)
