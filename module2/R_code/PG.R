library(rvest)
library(ggplot2)
edxsubjects <- read_html("https://www.edx.org/subjects")

subjectshtml<-html_nodes(edxsubjects, ".mb-4+ .mb-4 .align-items-center")
subjecttext<-html_text(subjectshtml)
print(subjecttext)

head(mtcars)
myData <- cars[c('speed', 'dist')]
head(myData)
myData$speed
g <- ggplot(myData, aes(x = speed, y = dist)) + geom_point()

gg <- g + coord_cartesian(xlim = c(10, 15), ylim = c(25, 50))
gg

head(mtcars)

h <- ggplot(mtcars, aes(x = wt)) + geom_histogram(binwidth = 0.5, color = "blue", fill = "green" )
h
hh <- h + geom_vline(aes(xintercept=mean(wt)), color = 'red', linetype = 'dashed')
hh
head(mtcars)


ggplot(mtcars, aes(x = wt)) + 
  coord_cartesian(xlim = c(2, 6)) +
  geom_histogram(aes(y = ..density..),
                 color = "blue", 
                 fill = 'green', 
                 bins = 10, 
                 alpha = 0.2) + 
  geom_density(alpha = 0.6, fill = 'red')

newplot




