#Load ggvis package
library(ggvis)

head(mtcars)

mtcars %>%
  ggvis(~ wt, ~ mpg, fill:= 'blue') %>%
  layer_points()

mtcars %>%
  ggvis(x =~ wt, y =~ mpg, fill =~ factor(cyl)) %>%
  layer_points()

mtcars %>%
  ggvis(x =~ wt, y =~ mpg, fill =~ factor(cyl), shape := 'cross') %>%
  layer_points()

mtcars %>% 
  group_by(cyl, am) %>% 
  ggvis(~hp, ~mpg, fill = ~interaction(cyl, am)) %>% 
  layer_points() %>%
  layer_model_predictions(model = "lm")

mtcars %>%
  ggvis(~hp, ~mpg,
        shape := input_select(label = 'Choose shape:',
                              choice = c('circle', 'square', 'diamond'))) %>%
  layer_points()
