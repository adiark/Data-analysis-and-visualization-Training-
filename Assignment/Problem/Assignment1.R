#(a)
group1 <- c(22,22,28,23,45,21,22)
group2 <- c(21,23,21,24,22,20,21)
group3 <- c(48,45,51,29,38,40,38)
#(b)
summary(group1)
summary(group2)
summary(group3)
summary(as.factor(group1))
summary(as.factor(group2))
summary(as.factor(group3))
# Answer Group3
#(c)
var(group1)
var(group2)
var(group3)
#Answer Group1
#(d)
boxplot(group1, group2, group3)
#Maximum , 3Rd Quartile, median, 1st Quartile, Minimum
#(E)
total=c(group1, group2, group3)
total

#(f)
hist(total)

#(g)
total_big <- total[total>25]
length(total_big)

#Question 2
#(a)
d <- c(0:99)
#(b)
e <- rnorm(100, mean = 3, sd= 4)
e
#(c)
f <- c()
f <- c(d,e)
f
#(d)
par(mfrow = c(1,3))
hist(d)
hist(e)
hist(f)
#(e)
f[65]

#question3

install.packages("bit64")
library(data.table)
help(fread)
setwd("C:\\Users\\Aditya Jain\\Desktop\\Trainee\\Week 3\\Day 3_Nitish\\Assignment\\Problem")
clothing_store = fread("Clothing_store.csv")
#(a)
n <- names(clothing_store)
count(clothing_store)
length(n)

#(b)
rows <- nrow(clothing_store)
data1 <- sort(sample(rows,rows*.7))
first <- clothing_store[data1,]
second <- clothing_store[-data1,]

#(c)

