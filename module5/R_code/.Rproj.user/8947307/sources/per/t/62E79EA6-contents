library(tidyr)
library(tidyverse)
provinces <- c("BC", "ON", "QB")

sample(x = provinces, size = 10, replace = TRUE)

sample <- rnorm(n = 9000, mean = 1, sd = sqrt(2))

mean(sample)
sd(sample)
sample_density <- density(sample)
type(sample_density)
glimpse(sample_density)
plot(smaple_density)
plot(sample_density)

coin = c('Heads', 'Tails')
toss = c()
for (i in 1:100) {
  toss[i] <- sample(x = coin, size = 1, replace = TRUE)
}
glimpse(toss)
ind = c(1:100)
df = data.frame(ind, toss)

ggplot(data = df, aes(x = toss)) + geom_bar()
glimpse(df)
head(df)
table(toss)



# Creating imaginary census data
marital <- c("married", 'single')
income <- 1:4
results <- matrix(nrow = 100, ncol = 3, data = NA)
colnames(results) = c('marital', 'income', 'province')

for (i in 1:length(ind)) {
  results[i, 1] <- sample(x = marital, size = 1, replace = TRUE)
  results[i, 2] <- sample(x = income, size = 1, replace = TRUE)
  results[i, 3] <- sample(x = provinces, size = 1, replace = TRUE)
}
head(results)

applied_var <- apply(X = results, MARGIN = 2, FUN = table)
head(applied_var)

defective <- rep("def", 6)
qualified <- rep("OK", 94)
shipment <- c(defective, qualified)
glimpse(shipment) 

k_sample <- sample(shipment, size = 22, replace = FALSE)  
table(k_sample)

k <- 32
repeated_sample <- matrix(nrow = 1000, ncol = k, data = NA)

for (i in 1:1000) {
  repeated_sample[i, ] <- sample(shipment, size = k, replace = FALSE)
}

counter = 0
for (i in 1:1000) {
  if ('def' %in% repeated_sample[i, ]) {
    counter = counter + 1
  }
}

qnorm(0.05, lower.tail = F)
# false_acceptance_rate <- 