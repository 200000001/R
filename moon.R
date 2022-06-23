raw_moon <- readLines("speech_moon.txt", encoding = "UTF-8")
head(raw_moon)
class(raw_moon)

library(stringr)
moon <- raw_moon %>% str_replace_all("[^가-힣]", " ")
head(moon)

moon <- str_trim(moon)
head(moon)

moon <- str_squish(moon)
head(moon)

library(dplyr)
moon <- as_tibble(moon)
moon

install.packages("tidytext")
library(tidytext)
moon_space <- moon %>% unnest_tokens(input= value, output = word,
                                    token = "words")
moon_space <- moon_space %>% count(word, sort = T)
moon_space

moon_space <- moon_space %>% filter(str_count(word) > 1)
moon_space

top20_moon <- moon_space %>% head(20)
top20_moon
library(ggplot2)

ggplot(top20_moon, aes(x= reorder(word, n) , y=n))+
  geom_col()+
  coord_flip()

install.packages("ggwordcloud")
library(ggwordcloud)

ggplot(moon_space, aes(label = word, size = n))+
  geom_text_wordcloud(seed = 1234) +
  scale_radius(limits = c(3, NA),
               range = c(3, 30))
