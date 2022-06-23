###경영정보학과_2017378_정민석###

##1번##
raw_park <- readLines("speech_park.txt", encoding = "UTF-8")
head(raw_park)

library(stringr)
gh <- raw_park %>% str_replace_all("[^가-힣]", " ")
head(gh)

gh <- str_squish(gh)
head(gh)


library(dplyr)
gh <- as_tibble(gh)
gh


library(tidytext)
gh_text <- gh %>% unnest_tokens(input= value, output = word,
                                     token = "words")
gh_text

##2번##
gh_text <- gh_text %>% count(word, sort = T)
gh_text

gh_text <- gh_text %>% filter(str_count(word) > 1)
gh_text

top20_gh <- gh_text %>% head(20)
top20_gh

##3번##
library(ggplot2)

ggplot(top20_gh, aes(x= reorder(word, n) , y=n))+
  geom_col()+ coord_flip()

