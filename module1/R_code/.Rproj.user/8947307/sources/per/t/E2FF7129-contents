library('tidyverse')
papers <- as.tibble(read_csv("CitesforSara.csv"))
glimpse(papers)

papers_select <- select(papers, journal, year, cites, title, au1)
glimpse(papers_select)

popular_papers_select <- filter(papers_select, cites >= 100)
glimpse(popular_papers_select)

papers_select %>% 
  group_by(journal) %>%
  summarize(tot_cit <- sum(cites))

length(unique(papers_select$au1))

papers_female <- select(papers, contains("female"))
head(papers_female)
