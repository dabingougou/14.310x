library(tidyverse)
# install.packages("broom")
library(broom)
library(AER)
data <- read.csv("data/census80.csv")

glimpse(data)
summary(data)

mul_preg_rate <- length(which(data$ageq2nd==data$ageq3rd)) / nrow(data)

data$mul_preg <- 0
data$mul_preg[which(data$ageq2nd==data$ageq3rd)] <- 1
#  mutate(test_var(data$ageq2nd==data$ageq3rd) = 1)

data$sam_sex <- 0
data$sam_sex[which(data$sex1st==data$sex2nd)] <- 1

data$threekids <- 0
data$threekids[which(data$numberkids == 3)] <- 1

glimpse(data)

first_2_kids_sam_sex_ratio <- sum(data$sam_sex) / nrow(data)

mod_status <- lm(data=data, formula=workedm ~ threekids + blackm + hispm + othracem)
mod_hours <- lm(data=data, formula=weeksm ~ threekids + blackm + hispm + othracem)
summary(mod_status)                         
summary(mod_hours)

first_stage_status <- lm(data=data, formula=threekids ~ mul_preg)
first_stage_weeks <- lm(data=data, formula=threekids ~ sam_sex)

summary(first_stage_status)
summary(first_stage_weeks)

iv_mod_status_on_mul <- ivreg(data=data, formula=workedm~threekids + blackm + hispm + othracem | mul_preg + blackm + hispm + othracem)
summary(iv_mod_status_on_mul)

iv_mod_status_on_sex <- ivreg(data=data, formula=workedm~threekids + blackm + hispm + othracem | sam_sex + blackm + hispm + othracem)
summary(iv_mod_status_on_sex)
