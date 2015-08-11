# Create vectors
var_x = sort(rnorm(100))
var_y = var_x * 2 + rnorm(100)
var_z = c(rep('A', 25), rep('B', 25), rep('C', 25), rep('D', 25))

# Create dataframe
df = data.frame(
  x = var_x,
  y = var_y,
  z = var_z
)
