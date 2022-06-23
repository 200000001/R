###경영정보학과_2017378_정민석###

string <- c("data anlaysis is useful",
            "business anlytics is helpful",
            "visualization of data is interesting for data scientists")
string

grep("data", string)
grep("data", string, value = TRUE)

string[grep("data", string)]

grepl("data", string)

regexpr(pattern = "data", text = string)

gregexpr("data", string)

regmatches(x=string, m=regexpr(pattern = "data", text = string))
regmatches(x=string, m=gregexpr(pattern = "data", text = string))

regmatches(string, regexpr("data", string), invert = TRUE)
regmatches(string, gregexpr("data", string), invert = TRUE)

sub(pattern = "data", replacement = "text", x=string)
gsub(pattern = "data", replacement = "text", x=string)

strsplit(string, " ")
unlist(strsplit(string, " "))
unique(unlist(strsplit(string, " ")))

string
gsub(pattern = "is|of|for", "",string)
unique(sub("date", "data", unique(unlist(strsplit(string, " ")))))



###2차시###
string <- c("data anlaysis is useful",
            "business anlytics is helpful",
            "visualization of data is interesting for data scientists")


library(stringr)

str_detect(string= string, pattern = "data")
?str_detect()

str_detect(string,"DATA")
str_detect(string, fixed("DATA",  ignore_case = TRUE))

str_detect(c("aby", "acy", "a.y"), "a.y")
str_detect(c("aby", "acy", "a.y"), fixed("a.y"))
str_detect(c("aby", "acy", "a.y"), "a\\.y")

str_locate(string, "data")
str_locate_all(string, "data")

str_extract(string, "data")
str_extract_all(string,"data")

str_extract_all(string,"data", simplify = TRUE)

unlist(str_extract_all(string,"data"))

sentences5 <- sentences[1:5]

str_extract(sentences5, "(a|A|the|The) (\\w+)")
str_extract_all(sentences5, "(a|A|the|The) (\\w+)")            

str_match(sentences5, "(a|A|the|The) (\\w+)")            
str_match_all(sentences5, "(a|A|the|The) (\\w+)")            

str_replace(string, "data", "text")
str_replace_all(string, "data", "text")

str_split(string, " ")
str_split(sentences5," ")
unlist(str_split(sentences5, " "))
unique(unlist(str_split(sentences5, " ")))

str_split(sentences5," ", n=5, simplify = TRUE)

str_length(string)

str_count(string, "data")
str_count(string, "\\w+")

mon <- 1:12
str_pad(mon, width = 2, side = "left", pad = "0")

string <- c("data anlaysis is useful",
            "business anlytics is helpful",
            "visualization of data is interesting for data scientists")
string_pad <- str_pad(string, width = max(str_length(string)),
        side = "both", pad = " ")

str_trim(string_pad, side= "both")
