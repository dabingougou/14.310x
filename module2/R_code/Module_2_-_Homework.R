rm(list = ls())

successes <- rbinom(1000, 8, 0.2)
length(successes)
#where n refers to number of observations, size refers to number of trials, 
#and prob refers to probability of success on each trial

#Question 9&10
hist(successes)

#Question 12
#probability of getting exactly 7 heads on 10 flips
den = dbinom(7, 10, 0.65) # where x is the observations, 
print(den)
#size is number of trials, prob is probability
cdf = pbinom(5, 10, 0.65) # where q is the number of observations,
print(cdf)
#size is the number of trials, prob is the probability
cdf2 = pbinom(5, 10, 0.65, lower.tail = F) # where q is the number of observations,
print(cdf2)
#Part A
_______
#Part B

#Part C


#Question 14
binom_draws <- as_tibble(data.frame(successes))
binom_draws

estimated_pf <- binom_draws %>%
  group_by(successes) %>%
  summarize(n=n()) %>%
  mutate(freq=n/sum(n))
estimated_pf

ggplot(estimated_pf, aes(x=successes, y=freq)) +
  geom_col() +
  ylab("Estimated Density")

#Question 15
#Create a tibble with x and the analytical probability densities.
my_binom<-as_tibble(list(x=0:1000, prob=dbinom(0:1000, 1000, 0.2)))
head(my_binom, 20)
#Plot the computed theoretical density.
ggplot(my_binom, aes(x=x, y=prob)) + geom_col() +
  ylab("Analytical Density")

calculated_cdf <- my_binom %>%
  mutate(cdf=cumsum(prob))

#Plot the computed cdf
ggplot(calculated_cdf, aes(x=x, y=cdf)) + geom_step() + 
  ylab("CDF")