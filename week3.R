###2017378 정민석###
product <- list(id="A001", name = "Mouse", price = 30000)
product

product[[3]] <- 40000
product
product[["price"]] <- 50000
product
product$price <- 60000
product

product[3] <- 70000
product

product[[3]] <- c(30000,40000)
product

product[3] <- list(c(50000,60000))
product

names <- c("Mon","Tue","Wed","Thur","Fri","Sat","Sun")
values <- c(842,729,786,844,851,750,702)

traffic.death <- list()
traffic.death

traffic.death[names] <- values
traffic.death

traffic.death <- 750
traffic.death[traffic.death < 750] <- NULL
traffic.death


df1 <- data.frame(sex = "female", month = 1, weight = 3.5)
df2 <- data.frame(sex = "male", month = 3, weight = 4.8)
df3 <- data.frame(sex = "male", month = 4, weight = 5.3)
df4 <- data.frame(sex = "female", month = 9, weight = 7.5)
df5 <- data.frame(sex = "female", month = 7, weight = 8.3)

lst <- list(df1,df2,df3,df4,df5)
lst

str(lst)

lst[[1]]
lst[[2]]

rbind(lst[[1]], lst[[2]])
a <- do.call(rbind, lst)
a

lst1 <- list(sex = "female", month = 1, weight = 3.5)
lst2 <- list(sex = "male", month = 3, weight = 4.8)
lst3 <- list(sex = "male", month = 4, weight = 5.3)
lst4 <- list(sex = "female", month = 9, weight = 7.5)
lst5 <- list(sex = "female", month = 7, weight = 8.3)
lst <- list(lst1, lst2, lst3, lst4, lst5)
lst

lst[[1]]
as.data.frame(lst[[1]])

lapply(lst, as.data.frame)

do.call(rbind, lapply(lst, as.data.frame))


?state
state.abb
state.area
state.name
state.region

us.state <- data.frame(state.abb, state.name, state.region, 
                       state.area, stringsAsFactors =FALSE )
us.state

str(us.state)

us.state[[2]]

str(us.state[[2]])

us.state[2]
us.state[c(2,4)]

us.state[ ,2]
us.state[ ,2, drop= FALSE]
us.state[ ,c(2,4)]

us.state[["state.name"]]
us.state$state.name
us.state[,"state.name"]

us.state[c("state.name", "state.area")]
us.state[, c("state.name", "state.area")]

#contition based indexing
state.x77
str(state.x77)

head(state.x77)

states <-  data.frame(state.x77)
states
str(states)

row.names(states)
states$Name <- row.names(states)
head(states)

row.names(states) <- NULL
head(states)

rich.states <- states[states$Income > 5000, c("Name", "Income") ]

head(rich.state)

large.states <- states[states$Area > 100000,
                       c("Name", "Area")]
head(large.states)

?merge

merge(rich.states, large.states, all.x = TRUE, key = "Name")
