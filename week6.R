###경영정보 2017378 정민석 ###

txt <- "Data Analytics is useful. Data Analytics is also interesting"
?sub()
sub(pattern = "Data", replacement = "Business", x=txt)
gsub(pattern = "Data", replacement = "Business", x=txt)
gsub(pattern = "Data", replacement = " ", x=txt)

text2 <- c("product.csv", "order.csv", "customer.csv")
gsub(".csv", "", text2)

words <- c("at", "bat", "cat", "chaenomeloes", "chase",
           "cheap", "check", "cheese", "chick", "hat", "chasse", "ca-t")
grep("che", words, value = TRUE)
grep("a", words, value = TRUE)
grep("at", words, value = TRUE)

grep("[ch]", words, value = TRUE)
grep("[at]", words, value = TRUE)
grep("che|at", words, value = TRUE)
grep("ch(e|i)ck", words, value = TRUE)


#수량자
grep("chas?e", words, value = TRUE)
grep("chas*e", words, value = TRUE)
grep("chas+e", words, value = TRUE)

grep("ch(a*|e*)se" ,words, value= TRUE)

#메타문자
grep("^c", words, value = TRUE)
grep("t$", words, value = TRUE)
grep("^c.*t$", words, value = TRUE)

grep("^[ch]?at", words, value = TRUE)

#문자 클래스
words2 <- c("12 Dec", "OK", "http://", "<TITLE>Time?<TITLE>", "12345", "Hi there")
grep("[[:alnum:]]", words2, value = TRUE)
grep("[[:alpha:]]", words2, value = TRUE)
grep("[[:digit:]]", words2, value = TRUE)
grep("[[:punct:]]", words2, value = TRUE)
grep("[[:space:]]", words2, value = TRUE)


#문자 클래스 시퀀스
grep("\\w+", words2, value = TRUE)
grep("\\s+", words2, value = TRUE)
grep("\\D+", words2, value = TRUE)
