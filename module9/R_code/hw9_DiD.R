install.packages("rdd")
library(rdd)
library(tidyverse)
raw_data <- read.csv("data/fastfood.csv")


glimpse(raw_data)
unique(raw_data$chain)

fit_pre_emp <- lm(data=raw_data, formula=empft ~ state)
summary(fit_pre_emp)

fit_pre_wge <- lm(data=raw_data, formula=wage_st ~ state)
summary(fit_pre_wge)

fit_DiD <- raw_data %>% 
  mutate(pre_post_diff=empft2 - empft) %>%
  lm(formula=pre_post_diff ~ state) 
summary(fit_DiD)

fit_DiD <- lm(data=raw_data, formula=)

el_data <- read.csv("data/indiv_final.csv")

el_data <- el_data %>% 
  mutate(incum=sign(difshare)) 
table(el_data$incum)
freq <- 9950 / (14987 + 9950)
DCdensity(el_data$difshare, cutpoint=0, ext.out=T)
