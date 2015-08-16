# Set the seed
set.seed(1714)

# Create the variables
my_measure = rnorm(1000) + rep(c(0, 1.1, 1.2, 1.4, 1.8), 200)
my_dimension = as.factor(rep(c("A", "B", "C", "D", "E"), 200))
my_facet = as.factor(rep(c("One", "Another"), 500))
my_dataframe = data.frame(x = my_dimension, y = my_measure, f = my_facet)

# Test single vector
ognd_boxplot(measure = my_measure,
             dimension = my_dimension,
             title = "Simple box plot")

# Wait for key stroke
key_stroke = readline(prompt = 'Press Enter to continue...')

# Test dataframe and labels
ognd_boxplot(measure = y,
             dimension = x,
             dataframe = my_dataframe,
             title = "Dataframe and labels",
             measure_label = "Values",
             dimension_label = "Dimensions",
             facet_formula = ~f)
