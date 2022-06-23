###경영정보 2017378 정민석###
?mtcars
head(mtcars)

?subset()

subset(mtcars, subset = (mpg > 30), select = mpg)

subset(mtcars, subset = (cyl ==4 & am == 0), select = c(mpg, hp, wt, am))

subset(mtcars, subset = (mpg <mean(mpg)), select = mpg)


?USArrests
head(USArrests)
str(USArrests)

subset(USArrests, select = -UrbanPop)

?cor()
cor(subset(USArrests, select = -UrbanPop))
subset(USArrests, select = -c(UrbanPop, Rape))
head(subset(USArrests, select = -c(UrbanPop, Rape)))
cor(head(subset(USArrests, select = -c(UrbanPop, Rape))))


# tibble
as.data.frame()
tibble()

install.packages("tibble")
library(tibble)

v1 <- c("A001", "A002", "A003")
v2 <- c("Mouse", "Keyboard", "USB")
v3 <- c(30000, 35000, 40000)
tibble(id=v1, name=v2, price=v3)
product <- tibble(id=v1, name=v2, price=v3)
str(product)


tribble(
  ~id, ~name, ~price,
  "A001", "Mouse", 30000,
  "A002", "Keyboard", 35000,
  "A003", "USB", 40000)
)

tb <- tibble(id=c(1,2,3),
       data = list(tibble(x=1, y=2),
                   tibble(x=4:5, y=6:7),
                   tibble(x=10)))

tb
tb$data

tb$data[[2]]

str(iris)
iris
head(iris)
as_tibble(iris)

install.packages("Lahman")
library(Lahman)
str(Batting)

?Batting
Batting
head(Batting)

as_tibble(Batting)
Batting.tbl <- as_tibble(Batting)
Batting.tbl
Batting
Batting.tbl


#Apply()계열 함수
apply()
lapply()
sapply()
?apply()

x <- matrix(1:20, 4, 5)
x

apply(X=x, MARGIN = 1, FUN = max)
apply(X=x, MARGIN = 2, FUN = max)
apply(X=x, MARGIN = 2, FUN = min)
apply(X=x, MARGIN = 2, FUN = mean)
apply(X=x, MARGIN = 2, FUN = sum)


y <- array(1:24, c(4,3,2))
y
apply(y, 1, paste, collapse = ",")

a <- c(1,5,9,13,17,21)
a
paste(a)
paste(a, collapse = ",")

apply(y, 2, paste, collapse=",")

apply(y, 3, paste, collapse=",")

apply(y,c(1,2), paste, collapse=",")

Titanic
str(Titanic)

apply(Titanic, 1, sum)
apply(Titanic, 4, sum)
apply(Titanic, 2, sum)

apply(Titanic, "Class", sum)
apply(Titanic, c(1,4), sum)

exams <- list(Spring_2020 = c(78, 60, 89, 90, 96, 54),
              Spring_2021 = c(85, 78, 69, 90, 95),
              Spring_2022 = c(98, 96, 94, 89, 99, 100, 87),
              Spring_2023 = c(86, 98, 76, 89, 57, 79))
exams

lapply(exams, length)
sapply(exams, length)

sapply(exams, mean)
sapply(exams, sd)

sapply(exams,range)
lapply(exams, range)

?iris
head(iris)

str(iris)

lapply(iris, class)

sapply(iris, class)
sapply(iris, mean)

sapply(iris, function(x) ifelse(is.numeric(x), mean(x), NA))


