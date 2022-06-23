## 13주차 경영정보학과 2017378 정민석###
#워드 클라우드
library(quanteda)
library(tidytext)
library(tibble)
library(dplyr)
library(tm)
library(ggplot2)
set.seed(123)

library(wordcloud)
head(termfreq)
wordcloud(words = names(termfreq), freq= termfreq,
          scale = c(3,1), min.freq = 10,
          rot.per = 0.1, random.order = FALSE,
          colors = brewer.pal(6, 'Dark2'))

address.tf <- tidy(address.dtm)

address.tf <- address.tf %>%
  mutate(document = factor(document, levels =c("Clinton", "Bush", "Obama", "Trump", "Biden"))) %>%
  arrange(desc(count)) %>%
  group_by(document) %>%
  top_n(n=10, wt = count) %>%
  ungroup()
address.tf

ggplot(address.tf,
       aes(x=term, y=count, fill=document)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~document, ncol = 2, scales = "free") +
  labs(x=NULL, y= "Term Frequency count") +
  coord_flip()

ggplot(address.tf,
       aes(reorder_within(x=term, by=count, within=document), y =count, fill =document))  +
  geom_col(show.legend = FALSE) +
  facet_wrap(~document, ncol = 2, scales = "free") +
  scale_x_reordered() +
  labs(x=NULL, y= "Term Frequency count") +
  coord_flip()

#TF-IDF

address.dtm2 <- DocumentTermMatrix(address.corpus,
                                   control = list(weighting = weightTfIdf))

row.names(address.dtm2) <- c("Clinton", "Bush", "Obama", "Trump", "Biden")


inspect(address.dtm2)

termfreq <- colSums(as.matrix(address.dtm))

length(termfreq)

address.tfidf <- tidy(address.dtm2) %>%
  mutate(tf_idf = count, count = NULL)
address.tfidf

address.tfidf <- address.tfidf %>%
  mutate(document = factor(document, levels =c("Clinton", "Bush", "Obama", "Trump", "Biden"))) %>%
  arrange(desc(tf_idf)) %>%
  group_by(document) %>%
  top_n(n=10, wt = tf_idf) %>%
  ungroup()
address.tfidf

ggplot(address.tfidf,
       aes(reorder_within(x=term, by=tf_idf, within=document), y =tf_idf, fill =document))  +
  geom_col(show.legend = FALSE) +
  facet_wrap(~document, ncol = 2, scales = "free") +
  scale_x_reordered() +
  labs(x=NULL, y="tf_idf") +
  coord_flip()

#2차시#

us.president.address <- tidy(data_corpus_inaugural) %>%
  filter(Year > 2000) %>%
  group_by(President, FirstName) %>%
  summarise_all(list(~trimws(paste(., collapse = " ")))) %>%
  arrange(Year) %>%
  ungroup()

us.president.address


address.words <- us.president.address %>%
  unnest_tokens(word, text)
address.words

address.words <- address.words %>%
  anti_join(stop_words, by='word') %>%
  filter(!grepl(pattern ="\\d+", word)) %>%
  mutate(word=gsub(pattern = "'", replacement = "", word)) %>%
  mutate(word=gsub(pattern = "america|americas|american|americans",
                   replacement = "america", word))%>%
  count(President, word, sort = TRUE, name = 'count')%>%
  ungroup()
address.words  

#단어 빈도 시각화

address.words  %>%
  group_by(word)%>%
  summarise(count=sum(count))%>%
  arrange(desc(count))%>%
  top_n(n=10, wt=count) %>%
  ggplot(aes(reorder(word, count), count)) +
  geom_col(color='dimgray', fill='salmon', width = 0.6, show.legend = FALSE)+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  geom_text(aes(label=count), size=3.5, color='black', vjust=1)+
  labs(x=NULL, y='Term Frequency (count)')+
  coord_flip()

#tf-idf계산
address.words <- address.words %>%
  bind_tf_idf(term = word, document = President, n=count)
address.words

#시각화를 통해 tf-idf 순위 확인
address.words %>%
  arrange(desc(tf_idf)) %>%
  mutate(President = factor(President,
                            levels = c("Clinton", "Bush", "Obama", "Trump", "Biden"))) %>%
  group_by(President) %>%
  top_n(7, wt=tf_idf) %>%
  ungroup() %>%
  ggplot(aes(reorder_within(word, tf_idf, President), tf_idf, fill=President))+
  geom_col(show.legend = FALSE)+
  facet_wrap(~President, ncol=2, scales = "free")+
  scale_x_reordered()+
  labs(x=NULL, y='Term Frequency-Inverse Document Frequency')+
  coord_flip()


address.words %>%
  arrange(desc(tf)) %>%
  mutate(President = factor(President,
                            levels = c("Clinton", "Bush", "Obama", "Trump", "Biden"))) %>%
  group_by(President) %>%
  top_n(7, wt=tf_idf) %>%
  ungroup() %>%
  ggplot(aes(reorder_within(word, tf_idf, President), tf_idf, fill=President))+
  geom_col(show.legend = FALSE)+
  facet_wrap(~President, ncol=2, scales = "free")+
  scale_x_reordered()+
  labs(x=NULL, y='Term Frequency(proportion)')+
  coord_flip()

