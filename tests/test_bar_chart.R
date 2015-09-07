# Clean workspace and set seed
rm(list = ls())
set.seed(1918)

# Get the packages
library(dplyr)
library(gridExtra)

# Create variables
store_sales = data.frame(
  
  REVENUE = c(rnorm(n = 90, mean = 1000, sd = 50),
              rnorm(n = 90, mean = 850, sd = 40),
              rnorm(n = 90, mean = 500, sd = 25)),
  
  COUNTRY = c(rep(x = 'United States', times = 90),
              rep(x = 'Canada', times = 90),
              rep(x = 'Australia', times = 90)),
  
  STORE = rep(c('Apple', 'Google', 'Amazon'), times = 90)
  
)

# Make REVENUE a bit smaller on Google and Amazon for plotting purposes
store_sales$REVENUE = ifelse(test = store_sales$STORE == 'Google',
                             yes = store_sales$REVENUE * 0.90,
                             no = store_sales$REVENUE)
store_sales$REVENUE = ifelse(test = store_sales$STORE == 'Amazon',
                             yes = store_sales$REVENUE * 0.75,
                             no = store_sales$REVENUE)

# And round to cents
store_sales$REVENUE = round(x = store_sales$REVENUE, digits = 2)

# Sum REVENUE by CONTRY
sales_by_country = group_by(store_sales, COUNTRY) %>%
                   summarise(REVENUE = sum(REVENUE))

# Create a bar chart with total REVENUE per COUNTRY
c1 = bar_chart(measure = REVENUE,
               dimension = COUNTRY, 
               dataframe = sales_by_country,
               flip_coordinates = T)

# Sum REVENUE by STORE
sales_by_store = group_by(store_sales, STORE) %>%
                 summarise(REVENUE = sum(REVENUE))

c2 = bar_chart(measure = REVENUE,
               dimension = STORE,
               dataframe = sales_by_store,
               flip_coordinates = T)

# Get a summarised table with average REVENUE by STORE and COUNTRY
avg.store_sales = group_by(store_sales, COUNTRY, STORE) %>%
                  summarise(AVG.REVENUE = mean(REVENUE))

#
c3 = bar_chart(measure = AVG.REVENUE,
               dimension = COUNTRY,
               group = STORE,
               dataframe = avg.store_sales)

c4 = bar_chart(measure = AVG.REVENUE,
               dimension = COUNTRY,
               group = STORE,
               dataframe = avg.store_sales,
               bar_position = 'stack')

# Show a grid with the 4 plots
grid.arrange(c1, c2, c3, c4, ncol = 2)



