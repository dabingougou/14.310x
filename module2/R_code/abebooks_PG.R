library(rvest)
library(tidyr)
library(dplyr)

kiss <- read_html("https://www.abebooks.com/servlet/SearchResults?sts=t&cm_sp=SearchF-_-home-_-Results&an=walter+isaacson&tn=Kissinger%3A+A+Biography&kn=")

price <- kiss %>%
  html_nodes(".item-price") %>%
  html_text() %>%
  readr::parse_number()

print(price)

title <- kiss %>%
  html_nodes(".col-xs-8 , span") %>%
  html_text() %>%
  readr::parse_character()
print(title)