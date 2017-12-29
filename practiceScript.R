#Load ggvis package
library(ggvis)

head(mtcars)

mtcars %>%
  ggvis(~ wt, ~ mpg, fill:= 'blue') %>%
  layer_points()

mtcars %>%
  ggvis(x =~ wt, y =~ mpg, fill =~ factor(cyl)) %>%
  layer_points()
