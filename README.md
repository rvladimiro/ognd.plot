## On Games N' Data Plot

This package is a collection of functions that create plots in one line. My objective is to have a consistent look across all visualisations I need to produce without having to format every singe one of them and, whenever possible, write only one line of code.

Knowing ggplot2 is not necessary but it is useful.

##General purpose visualisations

__Box Plot__

Creates a box plot given a measure and a dimension. Color is automatically assigned to the dimension. Notches are added by default but can be removed.

__Scatter Plot and Bubble Chart__

Creates a scatter plot. Supports color and size, handling both automatically. Color support handles categorical and numerical variables. Bubble charts are a product of using this function with color and size simultaneously.
