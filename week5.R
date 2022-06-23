 ###2017378 경영정보학과 정민석###
  
x <- "We have a dream"
x

class(x)
nchar(x)

length(x)


y <- c("We", "have", "a", "dream")
y
nchar(y)
length(y)
length(y[4])
nchar(y[4])
     
letters

     
sort(letters, decreasing = TRUE)
fox.says <- "It is only with the HEART that one can See Rightly"
fox.says
     
tolower(fox.says)
toupper(fox.says)
    
fox.said <- "what is essential is invisible to the eye"
strsplit(fox.said, split = " ")
strsplit(fox.said, split = "")
      
fox.said.words <- unlist(strsplit(fox.said,split= " "))
fox.said.words
         
fox.said.words[3]
fox.said.words[1]
         
unlist(strsplit(fox.said, split = " "))[3]
        
strsplit(fox.said, split = " ")
        
p1 <- "one two three"
p2 <- "jung min seok"
p3 <- "four five six"
           
littleprice <- c(p1,p2,p3)
littleprice
strsplit(littleprice, split = " ")
strsplit(littleprice, split = " ")[[3]]
             
fox.said <- "WHAT IS ESSENTIAL is invisible to the Eye"
unlist(strsplit(fox.said, split= " "))
fox.said.words <- strsplit(fox.said, split = " ")[[1]]
fox.said.words
unique(fox.said.words)
unique(tolower(fox.said.words))
unique(toupper(fox.said.words))
               
paste("Everyone", "wants", "to", "fly")
paste0("Everyone", "wants", "to", "fly")
               
paste(fox.said.words)
paste(pi, sqrt(pi))
               
paste("25 degrees Celsius is", 25*1.8+32, "degree Fahrenheit")
               
heores <- c("Batman", "Captin America", "Hulk")
colores <- c("Black", "Blue", "Green")
paste(heores, colores)
paste("Type", 1:10)
paste(heores, "wants","to","fly")
                 
paste(fox.said.words, collapse = "-")
                 
#2차시시
paste(month.abb, 1:12, sep = "-")
paste(month.abb, 1:12, sep = "-", collapse = "_")
     
outer(1:3, 1:3)
            
countries <- c("KOR", "US", "EU")
stat <- c("GDP","Pop", "Area")
                 
outer(countries, stat, FUN = paste, sep = "-")
          
                 
customer <- "Jung"
buysize <- 10
deliveryday <- 2
                 
paste("hello", customer, ", your order of", buysize, 
      "product(s) will be delivered within",deliveryday)

sprintf("hello %s, your order of %s product(s) will be delivered within %s",
      customer, buysize, deliveryday)
                
customer <- c("Jung", "Kim", "Choi")
buysize <- c(10,8,9)
deliveryday <- c(2,3,7.5)
                 
paste("hello", customer, ", your order of", buysize, 
    "product(s) will be delivered within",deliveryday)
                
                   
sprintf("hello %s, your order of %s product(s) will be delivered within %s",
    customer, buysize, deliveryday)
                
?substr()
substr("Text Analytics", start = 1, stop = 4)
substr("Text Analytics", start = 6, stop = 14)
                 
substring("Text Analytics", 6)
class <- c("Data analytics", "Data visualization", "Data science introduction")
substr(class, 1, 4)
substring(class, 6)
                 
countries <- c("Korea, KR", "United states, US", "China, CN")
substring(countries, nchar(countries)-1)
substr(countries, nchar(countries)-1, nchar(countries))
                 
?islands
head(islands)

 
landnames <- names(islands)
index <- grep(pattern="New", x= landnames)
landnames[index]
landnames[grep(pattern="New", x=landnames)]
grep(pattern= "New", x=landnames, value = TRUE)

                 