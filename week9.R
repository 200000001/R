text <- c("Crash dieting is not the best way to lose weight. http://bbc.in/1G0J4Agg",
          "A vegetar$ian diet excludes all animal flesh (meat, poultry, seafood).",
          "Economists surveyed by Refinitiv expect the economy added 160,000 jobs.")

install.packages("tm")
library(tm)
data(crude)
crude

crude[[1]]
crude[[1]]$content
crude[[1]]$meta
text

VCorpus()
getSources()

VectorSource(text)

corpus.docs <- VCorpus(VectorSource(text))
class(corpus.docs)

corpus.docs
inspect(corpus.docs[1])
inspect(corpus.docs[[1]])

as.character(corpus.docs[[1]])
lapply(corpus.docs, as.character)

str(corpus.docs)
corpus.docs[[1]]$content

lapply(corpus.docs, content)
as.vector(unlist(lapply(corpus.docs, content)))

paste(as.vector(unlist(lapply(corpus.docs, content))), collapse = " ")

corpus.docs[[3]]$meta

meta(corpus.docs[[1]])
meta(corpus.docs[[1]], tag = "author")
meta(corpus.docs[[1]], tag = "id")

meta(corpus.docs[[1]], tag = "author", type = "local") <- "Dong-A"

cor.author <- c("Dong-A", "Ryu", "Kim")
meta(corpus.docs, tag = "author", type = "local") <- cor.author
lapply(corpus.docs, meta, tag = "author")

##2차시##
lapply(corpus.docs, meta)
category <- c("health", "lifestyle", "business")
meta(corpus.docs, tag = "category", type = "local") <- category
lapply(corpus.docs, meta, tag = "category")

meta(corpus.docs, tag = "origin", type = "local") <- NULL

corpus.docs.filter <- tm_filter(corpus.docs, FUN = function(x)
  any(grep("weight|diet", content(x))))

lapply(corpus.docs.filter, content)

index <- meta(corpus.docs, "author") == "Dong-A" | meta(corpus.docs, "author") == "Ryu"
lapply(corpus.docs[index], content)

writeCorpus(corpus.docs)
list.files(pattern = "\\.txt")

#텍스트 정제

getTransformations()

tm_map()
toupper()
tolower()

lapply(corpus.docs, content)
corpus.docs <- tm_map(corpus.docs, content_transformer(tolower))

# 불용어
stopwords("english")
corpus.docs <- tm_map(corpus.docs, removeWords, stopwords("english"))
lapply(corpus.docs, content)

myremoves <- content_transformer(function(x, pattern)
  {return(gsub(pattern, "", x))})

corpus.docs <- tm_map(corpus.docs, myremoves, "(f|ht)tp\\S+\\s*")
lapply(corpus.docs, content)

corpus.docs <- tm_map(corpus.docs, removePunctuation)

corpus.docs <- tm_map(corpus.docs, removeNumbers)

corpus.docs <- tm_map(corpus.docs, stripWhitespace)

corpus.docs <- tm_map(corpus.docs, content_transformer(trimws))

corpus.docs <- tm_map(corpus.docs, stemDocument)

corpus.docs <- tm_map(corpus.docs, content_transformer(gsub), pattern = "economist", 
                      replacement = "economi")
