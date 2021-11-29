#install.packages("tidyverse")
library(tidyverse)

head(mtcars)
my_cars <- select(mtcars, mpg, wt)
head(my_cars)

my_fit <- lm(formula=my_cars$mpg~my_cars$wt)

class(my_fit)
summary(my_fit)
names(my_fit)

plot(my_cars$mpg, my_cars$wt)
abline(my_fit, col="red")

# read.csv("/module8/R_code/data/nlsw88.csv")
# setwd("./module8/R_code")
