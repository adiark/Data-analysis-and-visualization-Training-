setwd("C:\\Users\\Aditya Jain\\Desktop\\Data Analytics\\Trainee\\Week 3\\Day 5_Arindam\\Assignment\\Problem\\data")
library(scatterplot3d)

#1
file_cereal <- read.csv("cereal.csv")

#2
scatterplot3d(file_cereal$rating, file_cereal$sugars, file_cereal$fiber, pch=16, highlight.3d = TRUE, type = "p", main = "3D Scatterplot")

#3
Rind <- sample(1 : nrow(file_cereal), 0.7*nrow(file_cereal))
Traind <- file_cereal[Rind,]
testd <- file_cereal[-Rind,]



model1 <- lm(rating~ sugars, data = Traind)
distPred <- predict(model1, testd)
summary(model1)

#4
model2 <- lm(rating~fiber , data = Traind)
distPred <- predict(model2, testd)
summary(model2)


#5
model3 <- lm(rating~ sugars + fiber, data = Traind)
distPred <- predict(model1, testd)
summary(model1)

#6
