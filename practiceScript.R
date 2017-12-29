#Load ggvis package
library(ggvis)

head(mtcars)

mtcars %>%
  ggvis(~ wt, ~ mpg, fill:= 'blue') %>%
  layer_points()
