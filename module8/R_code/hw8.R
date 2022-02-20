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

data <- read.csv("data/nlsw88.csv")
glimpse(data)

my_model <- lm(data=data, formula=lwage~yrs_school)
summary(my_model)

coefficients(my_model)
ci <- confint(my_model, level=0.9)

sum(residuals(my_model))

upper <- 0.092920 + qnorm(0.95, mean=0, sd=1) * 0.004333
lower <- 0.092920 - qnorm(0.95, mean=0, sd=1) * 0.004333

Mincer_ml <- lm(data=data, formula=lwage ~ yrs_school + ttl_exp)
summary(Mincer)
summary(Mincer_ml)

wwdata <- mutate(data, se = yrs_school + 2 * ttl_exp)
glimpse(wwdata)
restricted_Mincer_ml <- lm(data=wwdata, formula=lwage ~ se)
summarize(restricted_Mincer_ml)
summary(restricted_Mincer_ml)
