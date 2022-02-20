# Start working on HW 7
# Preliminaries
#-------------------------------------------------
install.packages('np')
#install.packages('perm')
library(perm)
rm(list = ls())
# setwd("")

# Questions 1 - 4
#-------------------------------------------------
perms <- chooseMatrix(8,4)
A <- matrix(c(0.462, 0.731, 0.571, 0.923, 0.333, 0.750, 0.893, 0.692), nrow=8, ncol=1, byrow=TRUE)
treatment_avg <- (1/4)*perms %*% A
control_avg <- (1/4)*(1-perms) %*% A
test_statistic <- abs(treatment_avg-control_avg)
#HC added block begin
apply(perms, MARGIN = 1, FUN = function(x) (x == c(0, 1, 0, 0, 0, 1, 1, 1)))
apply(apply(perms, MARGIN = 1, FUN = function(x) (x == c(0, 1, 0, 0, 0, 1, 1, 1))), MARGIN = 2, sum)

#HC added block end
rownumber <- apply(apply(perms, 1, 
                         function(x) (x == c(0, 1, 0, 0, 0, 1, 1, 1))), 
                   2, sum)
rownumber <- (rownumber == 8)
observed_test <- test_statistic[rownumber == TRUE]

larger_than_observed <- (test_statistic >= observed_test)
#numbers in which the statistic exceeds or is equal to the value in the observed date
sum(larger_than_observed)

fisher_p = sum(larger_than_observed) / choose(8, 4)
fisher_p
df <- data.frame(perms,control_avg,treatment_avg,test_statistic)

# Question 5 - 6
#-------------------------------------------------
simul_stat <- as.vector(NULL)
schools <- read.csv('teachers_final.csv')
set.seed(1001)
for(i in 1:6) {
  print(i)
  schools$rand <- runif(100, min=0,max=1)
  schools$treatment_rand <- as.numeric(rank(schools$rand)<=49)
  schools$control_rand = 1-schools$treatment_rand
  simul_stat <-append(simul_stat,
            sum(schools$treatment_rand*schools$open)/sum(schools$treatment_rand) 
            - sum(schools$control_rand*schools$open)/sum(schools$control_rand))
}

schools$control = 1-schools$treatment
actual_stat <- sum(schools$treatment*schools$open)/sum(schools$treatment) - sum(schools$control*schools$open)/sum(schools$control)

sum(abs(simul_stat) >= actual_stat)/NROW(simul_stat)

#Question 7 - 8
#---------------------------------------------------
#Printing the ATE
ate <- (schools$treatment %*% schools$open) / sum(schools$treatment) -
  ((1 - schools$treatment) %*% schools$open) / (NROW(schools) - sum(schools$treatment))
ate

control_mean <- sum(schools$control*schools$open)/sum(schools$control)
treatment_mean <- sum(schools$treatment*schools$open)/sum(schools$treatment)

s_c <- (1/(sum(schools$control)-1))*sum(((schools$open-control_mean)*schools$control)^2)
s_t <- (1/(sum(schools$treatment)-1))*sum(((schools$open-treatment_mean)*schools$treatment)^2)

Vneyman <- (s_c/sum(1 - schools$treatment) + s_t/sum(schools$treatment))
print(sqrt(Vneyman))
print(actual_stat/sqrt(Vneyman))

print(actual_stat-1.96*sqrt(Vneyman))
print(actual_stat+1.96*sqrt(Vneyman))

#Question 12
ate / 2

#Question 13
((qnorm(0.9) + qnorm(0.975)))^2 / ( ( ( (ate/2) ^2 ) / Vneyman) * 0.5 * (1 - 0.5))


#Question 15
#---------------------------------------------------
library(np)
attach(schools)
plot <-npreg(xdat=schools$pctpostwritten, ydat= schools$open, bws=0.04, bandwidth.compute=FALSE)
plot(plot)

treat <- filter(schools,  treatment==T)
control <- filter(schools, treatment==0)
ggplot(data=schools, aes(x=open)) +
#  coord_flip() +
#  geom_histogram() +
  stat_ecdf(data=treat, aes(x=open), color = 'red') + 
  stat_ecdf(data=control, aes(x=open), color = 'brown') + 
  xlab('proportion of open days') + 
  ylab('CDF')

ks.test(treat$open, control$open)





















