# Clean the workspace and set the seed
rm(list = ls())
set.seed(0023)

dates = seq(from = as.Date('2014-01-01'), 
            to = as.Date('2014-03-31'),
            by = 'day')

iap_sales = rbind(
  data.frame(DATE = dates,
             COUNTRY = 'United States',
             STORE = 'Apple',
             DAU = round(rnorm(n = length(dates), mean = 1000, sd = 50)),
             # Conversion rate increases
             PAYERS = round(rnorm(n = length(dates), mean = 25, sd = 2) * 
                            (1 + 1:length(dates) * 0.01)),
             REVENUE = round(rnorm(n = length(dates), mean = 500, sd = ))
  
  
  
  
  
  
  
  
)
