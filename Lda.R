#LDA Classification 
 library(MASS)

 ?lda #linear Discriminant Analysis
 
 mylda= lda(data=mtcars, cyl ~wt+mpg)
 mylda
 
 #prior probabilities give the proportions of a class in dataset
 #we see the group means for each independent variable and class
 #coeffecients are calculated to define the areas of each class
  plot(mylda)
  
  #to use the predict function, it is useful to create a data frame with test vector
  
  #test data as data frame
  wt=c(2.2,4,1.1,5)
  mpg=c(26,20,27,15)
  class=c(4,6,4,8)
  test=data.frame(wt,mpg,class)
  
  mylda.prediction=predict(object=mylda,newdata=test[,c(1,2)])$class
  # we specify that we want the class as output
  mylda.prediction
  
  table(mylda.prediction, test[,3])
  
  #the diagonal shows the correct prediction 
  
  