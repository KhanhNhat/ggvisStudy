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

mtcars %>%
  ggvis(~mpg) %>%
  layer_histograms(width = input_numeric(label = 'Choose a binwidth:',
                                         value = 1))

mtcars %>%
  ggvis(~mpg) %>%
  layer_histograms(width = input_slider(label = 'Choose a binwidth:',
                                        min = 1, max = 20))

mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~factor(cyl), size = ~hp) %>%
  layer_points() %>%
  add_legend('fill', title = 'Num of cylinder', orient = 'right') %>%
  add_legend('size', title = 'Horse power',
             properties = legend_props(legend = list(y = 80)))
