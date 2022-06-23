###2017378_경영정보_정민석###

text <- c("Crash dieting is not the best way to lose weight. http://bbc.in/1G0J4Agg",
          "A vegetar$ian diet excludes all animal flesh (meat, poultry, seafood).",
          "Economists surveyed by Refinitiv expect the economy added 160,000 jobs.")

source <- c("BBC", "FOX", "CNN")

library(dplyr)
text.df <- tibble(source = source, text = text)
text.df
class(text.df)

#tokenization
library(tidytext)
unnest_tokens(tbl = text.df, output =word , input =text )

head(iris)
iris %>% head(10)

tidy.docs <- text.df %>%
  unnest_tokens( output =word , input =text )
tidy.docs

print(tidy.docs, n= Inf)

tidy.docs %>% count(source) %>% arrange(desc(n))

#불필요한 단어 제거
?anti_join

stop_words
anti_join(tidy.docs, stop_words, by = "word")

tidy.docs <- tidy.docs %>% anti_join(stop_words, by = "word")
tidy.docs

word.removed <- tibble(word = c("http", "bbc.in", "1g0j4agg"))
tidy.docs <- tidy.docs %>% anti_join(word.removed, by = "word")
tidy.docs$word

grep("\\d+", tidy.docs$word)

tidy.docs <- tidy.docs[-grep("\\d+", tidy.docs$word), ]
tidy.docs$word

text.df$text <- gsub("(f|ht)tp\\S+\\s*", "", text.df$text)
text.df$text

text.df$text <- gsub("\\d+","", text.df$text)


tidy.docs <- text.df %>%
  unnest_tokens( output =word , input =text )
tidy.docs

tidy.docs <- tidy.docs %>% anti_join(stop_words, by = "word")

tidy.docs$word <- gsub("ian", "", tidy.docs$word)

tidy.docs$word <- gsub("economists", "economy", tidy.docs$word)

library(tm)
corpus.docs <- VCorpus(VectorSource(text))
corpus.docs

meta(corpus.docs, tag = "author", type= "local") <- source
lapply(corpus.docs, meta)


tidy(corpus.docs) %>% unnest_tokens(word, text) %>% select(source = author, word)

##2차시##

library(dplyr)
# 문재인 대통령 연설문 불러오기
raw_moon <- readLines("speech_moon.txt", encoding = "UTF-8")
moon <- raw_moon %>%
  as_tibble() %>%
  mutate(president = "moon")
# 박근혜 대통령 연설문 불러오기
raw_park <- readLines("speech_park.txt", encoding = "UTF-8")
park <- raw_park %>%
  as_tibble() %>%
  mutate(president = "park")

# 두 데이터 합치기
bind_speeches <- bind_rows(moon, park) %>%
  select(president, value)


bind_speeches %>% count(president)

head(bind_speeches)
tail(bind_speeches)

# 기본적인 전처리
library(stringr)
speeches <- bind_speeches %>%
  mutate(value = str_replace_all(value, "[^가-힣]", " "),
         value = str_squish(value))
speeches


# 토큰화
library(tidytext)
library(KoNLP)
speeches <- speeches %>%
  unnest_tokens(input = value,
                output = word,
                token = extractNoun)
speeches

frequency <- speeches %>%
  count(president, word) %>% # 연설문 및 단어별 빈도
  filter(str_count(word) > 1) # 두 글자 이상 추출
head(frequency)


# dplyr::slice_max() : 값이 큰 상위 n개의 행을 추출해 내림차순 정렬
top10 <- frequency %>%
  group_by(president) %>% # president별로 분리
  arrange(desc(n)) %>% # 상위 10개 추출
  head(10)
top10

top10 <- frequency %>%
  group_by(president) %>% # president별로 분리
  slice_max(n, n= 10)
top10

print(top10, )
install.packages("ggplot2")
library(ggplot2)

?desc
