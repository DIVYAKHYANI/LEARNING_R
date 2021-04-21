#KNN CLASSIFICATION

?mtcars

attach(mtcars)
library(lattice)

#model to classify the number of cylinders according to the weight and mpg
with(mtcars, xyplot(wt ~mpg, groups = cyl, auto.key=T, pch=20, cex=3))

library(class)

?knn
#train: the data we use to create our model
#test: the data we use to test if the model works
#k: number of neighbors we use for the model

#extra arguments:

#l: a minimum amount of votes of one class
# use.all: tie handling
# prob: shows the proportion of winning class votes

#data frame for training 
train <- cbind(mpg,wt)

#test data
test <- c(26,2.2)

knn(train, test, cl=cyl, k=2, prob=T)
