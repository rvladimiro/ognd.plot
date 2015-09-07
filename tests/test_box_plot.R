# Set the seed
set.seed(1714)

# Create the variables
arpu = rnorm(1000) + rep(c(0, 1.1, 1.2, 1.4, 1.8), 200)
# Clean up since I don't want negative ARPU values
arpu = arpu + abs(min(arpu)) + 0.5
# Create country, stores and dataframe
country = as.factor(rep(c("GER", "AUS", "CAN", "UK", "USA"), 200))
store = as.factor(rep(c("Apple", "Google"), 500))
dataframe = data.frame(COUNTRY = country, ARPU = arpu, STORE = store)


# Test single vector
box_plot(measure = arpu,
         dimension = country,
         title = "ARPU per Country")

# Wait for key stroke
key_stroke = readline(prompt = 'Press Enter to continue...')

# Test dataframe and labels
box_plot(measure = ARPU,
         dimension = COUNTRY,
         dataframe = dataframe,
         title = "ARPU per Country and Store",
         measure_label = "Average Revenue per User ($)",
         dimension_label = "Country",
         facet_formula = ~STORE)
