###The apply Family of functions
# an elegant way of doing loops

# apply (arrays - matrices)

#tapply (vectors can to split in different subsets)

#lapply (the whole subfamily is for vectors or lists)

##sapply(user friendly version of lapply)

##vapply(similar to sapply, modified return value)

##replicate (random nr generation)

#rapply(similar to lapply)
#eapply(environment, generates a list)
#mapply(multivariate, similar to sapply)
#by data frames, similar to tapply, factors needed, splits the df and does calculus on subset)

?apply

x = matrix(c(1:9), nr=3, byrow=T)
x

#Margin :: 1 is for row, 2 is for col

apply(x,1,mean)
apply(x,2,mean)

apply(x,1,plot)

